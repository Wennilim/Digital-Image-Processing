clear all, close all, clc

I = imread('circuit.tif');
subplot(2,1,1),imshow(I)
subplot(2,1,2),imhist(I)