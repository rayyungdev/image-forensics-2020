function [image] = JPEG_Decode(filepath)

%%
[rowN, colN, d8, Q, nmat]=JPEG_entropy_decode(filepath);

cells=cell(64);
rcount=1;
ccount=1;

for a=1:rowN
    test = nmat(a,:);
    x8 = Vector2ZigzagMtx(test);
    x8 = idct(x8 .* Q) + 128;
    cells{rcount,ccount} = x8;
    ccount=ccount+1;
    if ccount > 64
        ccount=1;
        rcount=rcount+1;
    end
end

cells=cell2mat(cells);
cells=uint8(cells);
imwrite(cells, 'decodedimage.jpg', 'jpg');
imshow(cells);
end

