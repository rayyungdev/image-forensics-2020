function [NewPixels] = LFilter(Pixels,Alpha)
Lfilt=[0,-.25, 0; -.25, 1, -.25; 0 -.25 0];
gx=filter2(Lfilt, Pixels);
NewPixels=uint8(double(Pixels) + double(Alpha) * double(gx));
imshowpair(Pixels,NewPixels, 'montage')
end

