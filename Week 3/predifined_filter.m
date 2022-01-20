%Predifined Filter

clear all, close all, clc
 
%original picture
cat=imread('cat.jpg');
subplot(1,4,1), imshow(cat),title('Original') 
 
%motion blur
h=fspecial('motion', 20, 45);
cat_motion=imfilter(cat,h);
subplot(1,4,2), imshow(cat_motion),title('Motion Blur') 
 
%sharpening
%see section 7.6 (esp7.6.2)
h=fspecial('unsharp');
cat_sharp=imfilter(cat,h);
subplot(1,4,3), imshow(cat_sharp),title('Sharpening') 
 
%horizontal edge-detection
%see section 7.2 and 7.3.1
h=fspecial('sobel');
cat_sobel=imfilter(cat,h);
subplot(1,4,4), imshow(cat_sobel),title('Horizontal edge-detection')  
