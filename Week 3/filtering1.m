clear all, close all, clc

cat = imread('cat.jpg');
h=fspecial('average',5);
subplot(1,3,1),imshow(cat),title('Original')

results1=imfilter(cat,h);
subplot(1,3,2),imshow(results1), title('Zero-Padded') 

results2=imfilter(cat,h,'replicate');
subplot(1,3,3),imshow(results2), title('Replicate') 