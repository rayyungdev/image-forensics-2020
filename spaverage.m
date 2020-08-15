function [newPixels] = spaverage(pixels, shape)
Avg=ones(shape)/9; % 1/9 matrix
newPixels=uint8(filter2(Avg, pixels));
end

