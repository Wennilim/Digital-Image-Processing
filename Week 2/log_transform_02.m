%Log transformation 2
  
clear all, close all, clc
tire = imread('tire.tif');
d = im2double(tire);
subplot(2,4,1), imshow(d),title('Original') %log on domain [0,1] 
f = d; c =1/log(1+1); j1 = c*log(1+f); 
subplot(2,4,2), imshow(j1), title('log on domain[0,1]') %log on domain [0, 255] 
f = d*255; c =1/log(1+255); j2 =c*log(1+f); 
subplot(2,4,3), imshow(j2), title('log on domain[0,255]') %log on domain [0, 2^16]
f = d*2^16; c =1/log(1+2^16); j3 =c*log(1+f); 
subplot(2,4,4),imshow(j3),title('log on domain[0,65535]') 
subplot(2,4,5),imhist(d)
subplot(2,4,6),imhist(j1)
subplot(2,4,7),imhist(j2)
subplot(2,4,8),imhist(j3)
