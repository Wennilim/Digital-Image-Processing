clear all, close all, clc

rgb = imread('fruits.jpg');
hsi = rgb2hsi(rgb)

subplot(1,2,1), imshow(rgb), title('RGB')
subplot(1,2,2), imshow(hsi), title('HSI')