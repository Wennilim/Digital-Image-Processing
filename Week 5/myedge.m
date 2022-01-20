clear all, close all, clc

I=imread('building01.jpg');
I=rgb2gray(I);
subplot(3,2,1), imshow(I),title('Original')
BW1=edge(I,'Canny');
subplot(3,2,3),imshow(BW1),title('Canny')
BW2=edge(I,'Prewitt');
subplot(3,2,5),imshow(BW2),title('Prewitt')
BW3=edge(I,'Sobel');
subplot(3,2,2),imshow(BW3),title('Sobel')
BW4=edge(I,'Roberts');
subplot(3,2,4),imshow(BW4),title('Roberts')
BW5=edge(I,'zerocross');
subplot(3,2,6),imshow(BW5),title('Zero Cross')

%figure
% imshowpair(BW1,BW2,'montage')