clear all, close all, clc

%f(x,y)
I = imread('eight.tif');
subplot(2,3,1),imshow(I), title('Original')
subplot(2,3,4),imhist(I)

%g(x,y)
%add noise: Salt & pepper
d = 1.0 %noise density 0.1,0.2,0.3,...,0.9,1.0
J = imnoise(I,'salt & pepper',d);  
subplot(2,3,2),imshow(J),eval(['title(''Salt & Pepper, d = ',num2str(d),''')'])
subplot(2,3,5),imhist(J)


%median filtering
s = 32; %filter size 3，5，7，...
L = medfilt2(J,[s s]);
subplot(2,3,3), imshow(L), eval(['title(''Average filtering  ', num2str(s),' X ', num2str(s),''')'])
subplot(2,3,6),imhist(L)




