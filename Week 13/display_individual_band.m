clear all, close all, clc
b1 = imread('b1_cropped.tif');
b2 = imread('b2_cropped.tif');
b3 = imread('b3_cropped.tif');
b4 = imread('B4_cropped.tif');
b5 = imread('B5_cropped.tif');
b6 = imread('B6_cropped.tif');
b7 = imread('B7_cropped.tif');
subplot(2,4,1),imshow(histeq(b1)),title('Band 1');
subplot(2,4,2),imshow(histeq(b2)),title('Band 2');
subplot(2,4,3),imshow(histeq(b3)),title('Band 3');
subplot(2,4,4),imshow(histeq(b4)),title('Band 4');
subplot(2,4,5),imshow(histeq(b5)),title('Band 5');
subplot(2,4,6),imshow(histeq(b6)),title('Band 6');
subplot(2,4,7),imshow(histeq(b7)),title('Band 7');

