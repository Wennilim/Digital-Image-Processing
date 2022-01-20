

% Now, you will classify a 7-band Landsat image.  All steps after the 
% initial reading in of data are done in the same way.
%
clear all, close all, clc;
%
%  1) READ IN THE IMAGE AND LOOK AT THE BANDS
% Read in the 3-band image.  Look at the composite RGB and at each band
%
   %z=imread('demo.jpg');
   b1=imread('B1_cropped.tif');
   b2=imread('B2_cropped.tif');
   b3=imread('B3_cropped.tif');
   b4=imread('B4_cropped.tif');
   b5=imread('B5_cropped.tif');
   b6=imread('B6_cropped.tif');
   b7=imread('B7_cropped.tif');


   figure(1),clf
   subplot(2,2,1),imshow(cat(3,histeq(b4),histeq(b3),histeq(b2))),title('composite')
   subplot(2,2,2),imshow(histeq(b4)),colorbar('horiz'),title('red')
   subplot(2,2,3),imshow(histeq(b3)),colorbar('horiz'),title('green')
   subplot(2,2,4),imshow(histeq(b2)),colorbar('horiz'),title('blue')
%
%  2) CREATE A TRAINING SET
% Identify the location (row,column) of "training pixels" and assign them a "group number":
% You will need to identify at least 2 training pixels per group
%
   tpix=[36,887 ,1;... % Group 1: Water
         25,843 ,1;... 
         450,566,2;... % Group 2: Clouds
        918, 704,2;...
        140,88,3;... % Group 3:  oil palm
        289,471,3;...
        459,272,4;... % Group 4: Bare land
        454,282,4; 
        489, 651,5;
        479, 615,5];... % Group 5: Built-up areas
       
    
    
   row=tpix(:,1);   % y-value
   col=tpix(:,2);   % x-value
   group=tpix(:,3); % group number
   ngroup=max(group);
%
% From these pixels, make a training set consisting of each training pixel's band values
% "train" should have the same number of rows as the number of training pixels, and the
% same number of columns as number of bands (in this case 3, in Lansat case 7).  
%   
   train=[];
   for i=1:length(group)
     train=[train; b1(row(i),col(i)), b2(row(i),col(i)), b3(row(i),col(i)),b4(row(i),col(i)), b5(row(i),col(i)), b6(row(i),col(i)), b7(row(i),col(i))];
   end
%
%  3A) PREPARE DATA FOR CLASSIFICATION
% Reshape image into one long vector of pixel band values.
% Convert from uint8 to double for classification.
%
   nx=1001;
   ny=1051;
   N=nx*ny;
   %nz=7;
   AllPix=[reshape(b1,N,1),reshape(b2,N,1),reshape(b3,N,1),reshape(b4,N,1),reshape(b5,N,1),reshape(b6,N,1),reshape(b7,N,1)];
   
   AllPix=double(AllPix);
   train=double(train);
%
%  3B) CLASSIFY THE IMAGE
% Classify the image. Matlab's "classify" function requires the Statistics toolbox.
%   train and sample must have same number of columns.
%   train and group must have same number of rows.
%   misfit is nx-by-ny-by-ngroups and has probability (0-1) that each is a member of that group
% This may take up to a minute.  tic and toc will time the calculation
%
     tic
   [class,err,misfit]=classify(AllPix,train,group,'Diaglinear');
     toc
%
%  3C) LOOK AT THE CLASSIFIED IMAGE
% Reshape the Class vector and Each group error vetor (Nx1) back into an nx x ny matrix.
%
   class=reshape(class,nx,ny);
   misfit=reshape(misfit,nx,ny,ngroup);
%
% Visualize the classification.
% You could do this with any colormap, or you can make your own with RGB values
% for each Group Number that make sense to you.
%   
   map=[0,0,255;...   % Group 1: Water
        255,255,255;...   % Group 2: Clouds
        50,255,50;...   % Group 3: Oil palm
        128,0,0;...   % Group 4: Bared land
    192,192,192]/255;...   % Group 5: Built-up areas
	
   
   figure(2),clf,colormap(map)
   image(class),colorbar
   title('1=Water, 2=Cloud, 3= Oil Palm, 4=Bared Land, 5=Buildings')
%
%  4) OPTIONAL: LOOK AT THE MISFIT
% Now identify pixels that weren't well fit by any of the Groups we identified.
% Look at the posterior fits for each group. 1=Good Fit, 0=Really Bad Fit
%
   figure(3),clf,
   subplot(2,3,1),imagesc(misfit(:,:,1)),colorbar,title('Water')
   subplot(2,3,2),imagesc(misfit(:,:,2)),colorbar,title('Cloud')
   subplot(2,3,3),imagesc(misfit(:,:,3)),colorbar,title('Oil Palm')
   subplot(2,3,4),imagesc(misfit(:,:,4)),colorbar,title('Bared Land')
   subplot(2,3,5),imagesc(misfit(:,:,5)),colorbar,title('Built-up Areas')
   
%
% Look at the maximum fit achieved for each pixel
%
   M=max(misfit,[],3);
   figure(4),clf
   imagesc(M),colorbar,title('maximum fit (1=perfect,0=not at all)')
%
% Find the location of pixels that aren't fit well by any of the classes (max fit < 0.9)
% Change the classification (group number) of these pixels to a new group
%
   I=find(M<0.90);
   class2=class;
   class2(I)=ngroup+1;
%
% Visualize the classification again, this time taking into account pixels that are poorly fit
%   
   map=[0,0,255;...   % Group 1: Water
        255,255,255;...   % Group 2: Clouds
	50,255,50;...   % Group 3:  oil palm
    128,0,0;...   % Group 4: Bared land
    192,192,192;...   % Group 5: built-up areas
	000,000,000]/255; % Group 6: Poorly Fit Pixels
   
   figure(5),clf,colormap(map)
   image(class2),colorbar
   title('1=Water, 2=Clouds, 3=Oil Palm, 4=Bared Land,5=Built-up Areas, 6=Bad Fit')

%  5) OPTIONAL: REDO THE CLASSIFICATION WITH A BETTER TRAINING SET
