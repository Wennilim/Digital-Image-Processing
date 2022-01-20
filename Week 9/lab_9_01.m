clear all, close all, clc
I = imread('coins.png');
subplot(3,3,1),imshow(I),title('Original')

bw1 = imbinarize(I,'adaptive'); %binarize the greyscale image
S1 = sum(bw1,'all'); %calculate no. of white pixels
subplot(3,3,2), imshow(bw1) %show binary image
eval(['title(''No of white pixels=',num2str(S1),''')']) 

bw2 = imfill(bw1,'holes'); %filling holes
S2 = sum(bw2,'all'); %calculate no. of white pixels
subplot(3,3,3), imshow(bw2) %binary image after filling holes
eval(['title(''No of white pixels=',num2str(S2),''')'])

bw3 = bwareafilt(bw2,[100 Inf]); %removing small noise pixels
S3 = sum(bw3,'all'); %calculate no. of white pixels
subplot(3,3,4), imshow(bw3) %binary image after noise pixels removed
eval(['title(''No of white pixels=',num2str(S3),''')'])

basic_properties = regionprops('table',bw3,'basic')%display basic properties 
all_properties = regionprops('table',bw3,'all')

%B. TO DRAW CIRCLE AROUND EACH COINS%
%1. Get centers and radii of the circles by making use Centroid,
%MajorAxisLength & MinorAxisLength %
centers = all_properties.Centroid;
diameters = mean([all_properties.MajorAxisLength all_properties.MinorAxisLength],2);
radii = diameters/2;

%2. Plot the circles.%
subplot(3,3,5), imshow(bw3)
viscircles(centers,radii);
title('Image with Circles')
pause(3) % pause for seconds

%C. TO COUNT THE CIRCLES%
[L num_circles] = bwlabel(bw3,8)%returns the label matrix L that contains
%labels for the 8-connected objects found in bw3.
eval(['title(''There are ',num2str(num_circles),' circles'')'])


