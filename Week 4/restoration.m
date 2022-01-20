clear all, close all, clc

%f(x,y)
I = imread('eight.tif');
subplot(2,4,1),imshow(I), title('Original')
subplot(2,4,5),imhist(I)

%g(x,y)
%add noise: Salt & pepper
d = 0.02 %noise density, density range: 0.00-1.00
J = imnoise(I,'salt & pepper',d);  
subplot(2,4,2),imshow(J),eval(['title(''Salt & Pepper, d = ',num2str(d),''')'])
subplot(2,4,6),imhist(J)

%average filtering 会把 g(x,y) 变Smooth; original 图片是sharp的
%average filtering not a good filter for salt & pepper
s = 3; %average filter size; 数值越高，图片越不清楚
h = fspecial('average', s);
K = imfilter(J,h);
subplot(2,4,3), imshow(K), eval(['title(''Average filtering  ', num2str(s),' X ', num2str(s),''')'])
subplot(2,4,7),imhist(K)

%median filtering
L = medfilt2(J,[3 3]);
subplot(2,4,4), imshow(L), title('Median filtering')
subplot(2,4,8),imhist(L)




