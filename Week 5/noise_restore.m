clear all, close all, clc
nd=0.2;
s=5;

I=imread('eight.tif');%original image
subplot(3,1,1); imshow(I),title('Original Image')

J=imnoise(I,'salt & pepper',nd);%put noise to image
subplot(3,1,2);imshow(J),title(['Salt & Pepper noise density = ',num2str(nd)])

L = medfilt2(J,[s s]);% restore image
subplot(3,1,3);imshow(L),title(['Median filter size = ',num2str(s)])