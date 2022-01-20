clear all, close all, clc

I=imread('eight.tif');
subplot(3,1,1),imshow(I)
subplot(3,1,2),imhist(I)

Binary=roicolor(I,170,255);
subplot(3,1,3),imshow(Binary)