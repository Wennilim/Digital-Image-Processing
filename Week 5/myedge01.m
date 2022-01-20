clear all, close all, clc

I = imread('circuit.tif');
subplot(2,4,1),imshow(I),title('Original')

BW1 = edge(I,'Canny');
BW2 = edge(I,'Prewitt');
BW3 = edge(I,'log');
BW4 = edge(I,'ROberts');
BW5 = edge(I,'Sobel');
BW6 = edge(I,'zerocross');
subplot(2,4,2),imshow(BW1),title('Canny')
subplot(2,4,3),imshow(BW2),title('Prewitt');
subplot(2,4,4),imshow(BW3),title('log');
subplot(2,4,5),imshow(BW4),title('Roberts');
subplot(2,4,6),imshow(BW5),title('Sobel');
subplot(2,4,7),imshow(BW6),title('zerocross');
%figure
%imshowpair(BW1,BW2,'montage')





