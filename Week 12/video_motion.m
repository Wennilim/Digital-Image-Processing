clc, clear all, close all
%% Read and process a video into MATLAB
% Setup: create Video Reader and Writer
videoFileReader = VideoReader('beritatv3.avi');
myVideo = VideoWriter('myFile.avi');
% Setup: create deployable video player and face detector
depVideoPlayer = vision.DeployableVideoPlayer;
faceDetector = vision.CascadeObjectDetector();
open(myVideo);
%% Detect faces in each frame
while hasFrame(videoFileReader)
 % read video frame
 videoFrame = readFrame(videoFileReader);
 % process frame
bbox = faceDetector(videoFrame);
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
 % Display video frame to screen
 depVideoPlayer(videoFrame);
 % Write frame to final video file
 writeVideo(myVideo, videoFrame);
 pause(1/videoFileReader.FrameRate);
end
close(myVideo)