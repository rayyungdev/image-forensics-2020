seg=zeros(8,8,rowN);

for j=1:rowN
    test=nmat(j,:);
    temp = Vector2ZigzagMtx(test);
    temp=idct2(temp.*Q)+128;
    seg(:,:,j)=temp;
end

image=dsegm(seg, 512, 512);
image=uint8(image);
imwrite(image, 'decodedimage.jpg', 'jpg');
imshow(image)