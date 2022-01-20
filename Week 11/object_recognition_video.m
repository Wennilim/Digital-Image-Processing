clear all, close all, clc
camera=webcam;%1. connect to cmera
nnet=alexnet;%load pretrained model that has been trainine dusing alexnet
while true%4.loop
picture=camera.snapshot;%2.take a picture
picture=imresize(picture,[227,227]);%7. resize picturesy(nnet,
label=classify(nnet,picture);%classify picture
image(picture);%3.show picture. can run and see result
title(char(label));%8.show label
drawnow % 6.draw. can run
end%5.end loop