clc
close all
clear all

I = imread('coins.png');
subplot(3,3,1), imshow(I);
subplot(3,3,2), imhist(I); %look at the hist to get a threshold, e.g., 110
BW=roicolor(I, 90, 255); % makes a binary image
BW = bwareafilt(BW,[100 Inf]);  %removing small noise pixels
 subplot(3,3,3), imshow(BW) % all pixels in (110, 255) will be 1 and white
		     % the rest is 0 which is black
             
 subplot(3,3,4), imhist(BW);
  
L = bwlabel(BW); % label each object
%Step 2: see the label of each object
s = regionprops(L, 'Centroid');
 imshow(BW)
hold on
for k = 1:numel(s)
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle');
end
hold off
% Step 3: find the area of the object you want using its label

Total_value=0;
Area_1=0;
figure
for k = 1:numel(s)

Obj = (L == k);   %  is the label number of the first object. 
coins_area = regionprops(Obj,'Area') % determine each coin area

for (k=1)
imshow(Obj);
end

if (coins_area.Area < 2000)
    Total_value=Total_value + 10;
else
    Total_value=Total_value + 20;
end

end
close
Final_total=Total_value/100
h = msgbox(['The total value is RM' num2str(Final_total)], 'Count Coins Result')


    
    

