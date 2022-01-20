function seperate_colour(rgbimage)

img = imread(rgbimage);
red = img(:,:,1);  
green = img(:,:,2)
blue = img(:,:,3)

subplot(2,4,1),imshow(img),title('Original Image')
subplot(2,4,2),imhist(img)
subplot(2,4,3),imshow(red),title('Red Component')
subplot(2,4,4),imhist(red)
subplot(2,4,5),imshow(green),title('Green Component')
subplot(2,4,6),imhist(green)
subplot(2,4,7),imshow(blue),title('Blue Component')
subplot(2,4,8),imhist(blue)