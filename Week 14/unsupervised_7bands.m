clc
clear all
close all
warning off
max_num_clusters=8;
%rgbImage = imread('peppers.png');
b1=imread('B1_cropped.tif');
b2=imread('B2_cropped.tif');
b3=imread('B3_cropped.tif');
b4=imread('B4_cropped.tif');
b5=imread('B5_cropped.tif');
b6=imread('B6_cropped.tif');
b7=imread('B7_cropped.tif');

subplot(1,2,1);
rgb432=cat(3,histeq(b4),histeq(b3),histeq(b2));
imshow(rgb432);
title('True Colour Composite Image');

data=double([b4(:), b2(:), b3(:), b1(:), b5(:), b6(:), b7(:)]);
%data=double([b4(:), b2(:), b3(:)]);
for i=1:max_num_clusters
cluster_num=i;
[m n]=kmeans(data,cluster_num);
m=reshape(m,size(b1,1),size(b1,2));
%n = n(:,[1:3]);
n=rand(max_num_clusters,3);
clusteredImage=label2rgb(m,n);
subplot(1,2,2);
imshow(histeq(clusteredImage));
title([num2str(i),' Clusters']);
end