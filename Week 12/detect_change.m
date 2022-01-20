clc, clear all, close all
% 1) Reading 2 images
a=imread('ada_pen.jpg'); % image captured at t1
b=imread('tak_ada_pen.jpg'); % image captured at t2
% 2) Using red channel (can use green or blue channel too)
a=a(:,:,1);
b=b(:,:,1);
% 3) Image substraction F(t+1) - F(t)
d=abs(b-a);
% 4) Converting to binary image
binary_d =im2bw(d, graythresh(d));
% 5) Displaying input images and substracted image (binary)
figure
subplot(1,3,1), imshow(a), title('Time 1')
subplot(1,3,2), imshow(b), title('Time 2')
subplot(1,3,3), imshow(binary_d), title('After Image Subtraction')
% 6) Using image mean difference as indicator.
if abs(mean(b(:))- mean(a(:)))> 0.5 % if mean difference larger that
%this threshold, change detected
 load gong.mat % load sound
 sound(y) % produce sound

h = msgbox('CHANGE DETECTED!!!')
else
 load chirp.mat % load sound
 sound(y) % produce sound
 h = msgbox('NO CHANGE!')
end