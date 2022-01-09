function trim_video(video_name, output_file_name, number_of_frames)
%=======================================================================
%trim_video Trim a video to a given number of frames
%   trim_video(video_name, output_file_name, number_of_frames) 
%
%   Input -----
%      'video_name': input video (mp4)
%      'output_file_name': output video (mp4)
%      'number_of_frames': how many frames to keep
%
%   Output ----- 
%       the videofile with the desired number of frames
%
%========================================================================

% Author: Lucy Kuncheva                                             ^--^
% 24.10.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%

v = VideoReader(video_name); % open the video
k = 1;

% Prepare the new file.
vo = VideoWriter(output_file_name,'MPEG-4');
open(vo)
while hasFrame(v) && k <= number_of_frames
    fprintf('%i\n',k)
    k = k + 1;
    b = readFrame(v);
    writeVideo(vo,b)
end
close(vo);
fprintf('A total of %i frames have been stored in %s\n',...
    k-1,output_file_name)
