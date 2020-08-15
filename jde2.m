function [image] = jde2(filepath)
[rowN, ~, ~, Q, nmat]=JPEG_entropy_decode(filepath);
seg=zeros(8,8,rowN);
for j=1:rowN
    test=nmat(j,:);
    temp = Vector2ZigzagMtx(test);
    temp=idct2(temp+128).*Q;
    seg(:,:,j)=temp;
end
seg=uint8(seg);
image=dsegm(seg, 512, 512);
imshow(image)
imwrite(image, 'decodedimage.jpg', 'jpg');
end

