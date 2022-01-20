% Connect to the webcam.
cam = webcam(1)
% Preview
preview(cam);

img = snapshot(cam);

% Display the frame in a figure window.
image(img);