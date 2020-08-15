function [nmat] = JPEG_Encode(Pixels)
Pixels = double(Pixels);
Q = [16 11 10 16 24 40 51 61; 
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56; 
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];
        
[rows, cols]=size(Pixels);

%% The following segments the picture to 8x8 blocks
% Figure out the size of each block in rows.
% Most will be blockSizeR but there may be a remainder amount of less than that.
wholeBlockRows = floor(rows / 8);
blockVectorR = [8 * ones(1, wholeBlockRows)];

% Figure out the size of each block in columns.
wholeBlockCols = floor(cols / 8);
blockVectorC = [8 * ones(1, wholeBlockCols)];

segment = mat2cell(Pixels, blockVectorR,     blockVectorC);
numPlotsR = size(segment, 1);
numPlotsC = size(segment, 2);

%% The cells are 64x64, we want to take the DCT of each block

nmat = zeros(4096,64);
count = 1;
% Sort through the outer matrix
for i = 1:numPlotsR
    for j = 1:numPlotsC
        % takes the DCT of the cell. Not sure if this needs to be a float
        temp = dct(segment{i,j} - 128)./Q;
        temp = ZigzagMtx2Vector(temp);
        nmat(count,:) = temp;
        count = count+1;
    end
end

JPEG_entropy_encode(4096, 64, 8, Q, nmat, './', 1)

end
