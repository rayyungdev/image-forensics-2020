baboon=imread('baboon.tif');
peppers=imread('peppers.tif');
Quality_Factors=[90, 70, 50, 30, 10];
L=length(Quality_Factors);
%% Create an Array to Easier Analysis
barray=zeros(3,L+1);
parray=zeros(3,L+1);

barray(1,:)=["Original",Quality_Factors];
parray(1,:)=["Original",Quality_Factors];
barray(2,1)=psnr(tb, tb);
parray(2,1)=psnr(tp, tp);
barray(3,1)=dir('baboon.tif').bytes;
parray(3,1)=dir('peppers.tif').bytes;
for i = 1:L
   bname="baboon"+Quality_Factors(i)+".jpeg";
   pname="peppers"+Quality_Factors(i)+".jpeg";
   imwrite(baboon,bname,'Quality',Quality_Factors(i));
   imwrite(peppers,pname,'Quality',Quality_Factors(i));
   tb1=imread(bname);
   tp1=imread(pname);
   
   barray(2,i+1)=psnr(tb1,baboon);
   barray(3,i+1)=double(dir(bname).bytes);
   
   parray(2,i+1)=psnr(tp1,peppers);
   parray(3,i+1)=double(dir(pname).bytes);  
end
format short g
barray
parray

%% Analysis of barray and parray
%File size decreases significanlty but so does quality. The image becomes almost blockier.
%PSNR also turns from positive to negative as a result
