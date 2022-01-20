%contrast stretching transformation

clear all, close all, clc
I=imread('tire.tif');
I2=im2double(I); m=mean2(I2)
contrast1=1./(1+(m./(I2+eps)).^4);
contrast2=1./(1+(m./(I2+eps)).^5);
contrast3=1./(1+(m./(I2+eps)).^10);
subplot(2,4,1),imshow(I2), title('Original')
subplot(2,4,2),imshow(contrast1),title('E =4')
subplot(2,4,3),imshow(contrast2),title('E=5')
subplot(2,4,4),imshow(contrast3),title('E=10')
subplot(2,4,5),imhist(I2)
subplot(2,4,6),imhist(contrast1)
subplot(2,4,7),imhist(contrast2)
subplot(2,4,8),imhist(contrast3)


