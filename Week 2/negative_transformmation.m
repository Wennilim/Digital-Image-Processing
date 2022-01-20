%nagetive transformation

clear all, close all, clc
I=imread('tire.tif'); 
subplot(2,2,1), imshow(I),title('Original')
J=imcomplement(I); 
%figure 
subplot(2,2,2),imshow(J),title('Negative')
subplot(2,2,3),imhist(I)
subplot(2,2,4),imhist(J)
