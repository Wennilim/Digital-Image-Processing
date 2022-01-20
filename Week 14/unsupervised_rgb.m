clc
clear all
close all
warning off
max_num_clusters=17;
rgbImage = imread('peppers.png');
subplot(1,2,1);
imshow(rgbImage);
title('Original Image');
redChannel=rgbImage(:, :, 1);
greenChannel=rgbImage(:, :, 2);
blueChannel=rgbImage(:, :, 3);
data=double([redChannel(:), greenChannel(:), blueChannel(:)]);
for i=1:max_num_clusters
cluster_num=i;
[m n]=kmeans(data,cluster_num);
m=reshape(m,size(rgbImage,1),size(rgbImage,2));
%n=n/255;
n=rand(max_num_clusters,3);
clusteredImage=label2rgb(m,n);
subplot(1,2,2);
imshow(clusteredImage);
title([num2str(i),' Clusters']);
end