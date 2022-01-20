% object recognition on still image using deep learning

clc, clear all, close all
camera=webcam;%connect camera
nnet=alexnet;%load neural net
picture=camera.snapshot;%take picture
figure(1)
image(picture);%show picture
picture=imresize(picture,[227,227]);%resizennet picture
label=classify(nnet,picture);%classify picture
title(upper(char(label)));%show the  label
