%Compound Morphological Operations: Closing

clear all, close all, clc
 
BW1 = imread('circles.png');
sumbw1 = sum(BW1,'all');
subplot(2,2,1),imshow(BW1)
eval(['title(''Original Image (sum = ',num2str(sumbw1),')'')'])
 
SE = strel('arbitrary',eye(5));
 
BW2 = imdilate(BW1,SE);
sumbw2 = sum(BW2,'all');
subplot(2,2,2), imshow(BW2)
eval(['title(''Dilated Image (sum = ' ,num2str(sumbw2),')'')'])
 
BW3 = imerode(BW2,SE);
sumbw3 = sum(BW3,'all');
subplot(2,2,3),imshow(BW3),
eval(['title(''Eroded Image (sum = ' ,num2str(sumbw3),')'')'])
 
BW4 = imclose(BW1,SE)
sumbw4 = sum(BW4,'all');
subplot(2,2,4),imshow(BW3),
eval(['title(''Closed Image (sum = ' ,num2str(sumbw4),')'')'])
