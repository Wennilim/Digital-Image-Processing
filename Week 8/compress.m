function y=compress(x)
%This function will compress any BMP RGB image file
%x is a file with RGB layers; for example x= 'flag.bmp'
%to run the function type: compress('flag.bmp');
%the output will show the original and compressed images with image size,
%Compression Ratio (C) and Redundancy (R)
I = imread(x);
k=imfinfo(x);cb=k.FileSize;
subplot(231), imshow(I), title({['Image Size = ',num2str(cb),'bytes']}),ylabel('bmp(original)');
imwrite(I,'myImage2.png'); I2=imread('myImage2.png');
k2=imfinfo('myImage2.png'); cb2=k2.FileSize; cr2=cb/cb2;r2=1-(1/cr2);
subplot(232), imshow(I2), title({['Image Size = ',num2str(cb2)],['C =',num2str(cr2)],['R = ',num2str(r2)]}),ylabel('png');
imwrite(I,'myImage3.hdf');I3=imread('myImage3.hdf');
k3=imfinfo('myImage3.hdf'); cb3=k3.FileSize; cr3=cb/cb3;r3=1-(1/cr3);
subplot(233), imshow(I3), title({['Image Size = ',num2str(cb3)],['C =',num2str(cr3)],['R = ',num2str(r3)]}),ylabel('hdf');
imwrite(I,'myImage4.jpg');I4=imread('myImage4.jpg');
k4=imfinfo('myImage4.jpg');cb4=k4.Width*k4.Height*k4.BitDepth/8;
cb4=k4.FileSize; cr4=cb/cb4;r4=1-(1/cr4);
subplot(234), imshow(I4), title({['Image Size = ',num2str(cb4)],['C= =',num2str(cr4)],['R = ',num2str(r4)]}),ylabel('jpg');
imwrite(I,'myImage6.ppm');I6=imread('myImage6.ppm');
%[m,p]=fidelity(x,'myImage6.ppm');
k6=imfinfo('myImage6.ppm'); cb6=k6.FileSize; cr6=cb/cb6;r6=1-(1/cr6);
subplot(235), imshow(I6), title({['Image Size = ',num2str(cb6)],['C =',num2str(cr6)],['R = ',num2str(r6)]}),ylabel('ppm');
imwrite(I,'myImage7.tiff');I7 =imread('myImage7.tiff');
k7=imfinfo('myImage7.tiff'); cb7=k7.FileSize; cr7=cb/cb7;r7=1-(1/cr7);
subplot(236), imshow(I7), title({['Image Size = ',num2str(cb7)],['C =',num2str(cr7)],['R = ',num2str(r7)]}),ylabel('tiff');