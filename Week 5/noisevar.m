clear all, close all, clc
n=10
nd=n/10;

x=[0:0.1:nd];
y=ones(1,n+1);

I=imread('eight.tif');%original image
varI=var(single(I(:)));
subplot(4,1,1); imshow(I),title(['Original, image var=',num2str(varI)])

for a=0:1:n;
    nd=a/10;
J=imnoise(I,'salt & pepper',nd);%put noise to image
varJ=var(single(J(:)));
y(1,a+1)=varJ;
end
subplot(4,1,2);imshow(J),title(['Salt & Pepper noise density = ',num2str(nd),',image var=',num2str(varJ)])

x
y

subplot(4,1,3)
scatter(x,y)
xlabel('Noise Density')
ylabel('Variance')

hold on 
p2 = polyfit(x, y, 2)
% see interpolated values of fits
xc = x; 
% plot 2nd order polynomial
y2 = polyval(p2, xc);
plot(xc, y2, 'g.-') 
title(['y = ',num2str(p2(1,1)),'x2 + ',num2str(p2(1,2)),'x + ',num2str(p2(1,3))])
    
%%%%%%

subplot(4,1,4)
scatter(y,x)
ylabel('Noise Density')
xlabel('Variance')

hold on 
p2 = polyfit(y, x, 2)
% see interpolated values of fits
xc = y; 
% plot 2nd order polynomial
y2 = polyval(p2, xc);
plot(xc, y2, 'g.-') 
title(['y = ',num2str(p2(1,1)),'x2 + ',num2str(p2(1,2)),'x + ',num2str(p2(1,3))])
    
