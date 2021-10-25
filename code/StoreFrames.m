clear, clc, close all

% Author: Lucy Kuncheva 
% 20/10/2021

imfolder = 'Koi_5652_952_540'; % to store the frames
v = VideoReader('Koi_5652_952_540.mp4'); % open the video

if ~exist(imfolder,'dir') 
    mkdir(imfolder)
end
k = 0;
while hasFrame(v)
    k = k + 1;
    fprintf('%i\n',k)
    frame = readFrame(v);
    imwrite(frame,[imfolder,'/scene',sprintf('%05d',k),'.jpg'])
end
