%Log transformation 1
  
clear all,close all, clc
I = imread('tire.tif');
imshow(I)
I2 = im2double(I);
J = 1*log(1+I2);
J2 = 2*log(1+I2);
J3 = 5*log(1+I2);
subplot(2,4,1),imshow(I),title('Original');
subplot(2,4,2),imshow(J), title('c=1');
subplot(2,4,3),imshow(J2),title('c=2');
subplot(2,4,4),imshow(J3),title('c=5');
subplot(2,4,5),imhist(I)
subplot(2,4,6),imhist(J)
subplot(2,4,7),imhist(J2)
subplot(2,4,8),imhist(J3)
