
for ii = 1:3
    intro = 'LSBwmk';
    extension = '.tiff';
    image = append(intro,num2str(ii),extension)
    figure
    suptitle(num2str(image))
for jj = 1:8
    [bp] = get_bp(image, jj);
    subplot(2,4,jj)
    imshow(bp, []);
    title(['Layer ' num2str(jj)])
    hold on
end

end

