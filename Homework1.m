%Homework 1
%% Part 1
figure(1)
pout= imread('MoonPhobos.tif');
GammaCorrection(pout, .25);
%% Part 2
moon=imread('moon.tiff');
focus=imread('outoffocus.tif');
figure(2)
LFilter(moon, 3);
figure(3)
LFilter(focus, 5);
%% Part 3
pep1=imread('peppersNoise1.tiff');
pep2=imread('peppersNoise2.tiff');
npep15x5=medfilt2(pep1, [10 10]); % 5x5 Median Filter
npep13x3=medfilt2(pep1); %default value is 3x3
figure(4)
imshowpair(pep1,npep15x5, 'montage')
figure(5)
imshowpair(pep1,npep13x3, 'montage')
%% Part 3 Cont
figure(6)
imshowpair(pep1,spaverage(pep1,5), 'montage');
figure(7)
imshowpair(pep1,spaverage(pep1,3),'montage');
%% Part 3 End



