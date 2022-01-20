%gamma transformation

clear all, close all, clc
 
I=imread('tire.tif');
J=imadjust(I,[],[],1);
J2=imadjust(I,[],[],3); 
J3=imadjust(I,[],[],0.4);
subplot(2,3,1),imshow(J); title('gamma=1')
subplot(2,3,2),imshow(J2); title('gamma=3')
subplot(2,3,3),imshow(J3);title('gamma=0.4')
subplot(2,3,4),imhist(J)
subplot(2,3,5),imhist(J2)
subplot(2,3,6),imhist(J3)

