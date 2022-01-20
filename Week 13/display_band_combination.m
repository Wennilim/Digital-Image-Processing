clear all, close all, clc
b5=imread('B5_cropped.tif');
b4=imread('B4_cropped.tif');
b1=imread('b1_cropped.tif');
B5=histeq(b5);
B4=histeq(b4);
B1=histeq(b1);
rgb541=cat(3,B5,B4,B1); imshow(rgb541),title('rgb541');
datacursormode on
