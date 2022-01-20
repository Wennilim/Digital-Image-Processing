%Fundamental Morphological Operations

clear all, close all, clc
 
BW1 = imread('circbw.tif');
subplot(1,3,1)
imshow(BW1),title('Original')
SE = strel('square',9);
BW2=imerode(BW1,SE)
subplot(1,3,2)
imshow(BW2),title('Erode')
BW3=imdilate(BW1,SE)
subplot(1,3,3)
imshow(BW3),title('Dilate')

