function store_frames(im_folder,video_file)
%=======================================================================
%store_frames Stores the frames from a video as separate images
%   
%   store_frames(im_folder,video_file) The frames are stored with names
%       'sceneXXXXX.jpg', where XXXXX is a strong with the frame's number
%       pre=padded with zeros. For eample, frame 3 will be stored in
%       'scene00003.jpg'. If the folder does not exist, is will be 
%       created by the programme.
%   
%   Input -----
%      'im_folder': folder to store the frames in
%      'video_file': video file name with 
%
%   Output -----
%      folder with the frames
%========================================================================

% (c) Lucy Kuncheva                                                 ^--^
% 22.10.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%

v = VideoReader(video_file); % open the video

if ~exist(im_folder,'dir') 
    mkdir(im_folder)
end
k = 0;
while hasFrame(v)
    k = k + 1;
    fprintf('%i\n',k)
    frame = readFrame(v);
    imwrite(frame,[im_folder,'/scene',sprintf('%05d',k),'.jpg'])
end
