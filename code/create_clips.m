function create_clips(folder,bb_file)
%=======================================================================
%create_clips Saves the clips from the frames in 'folder'
%   create_clips(folder,bb_file)
%   Each frame is examined in turn and the clips from the bounding
%   boxes are cropped and stored in sub-folders with the name of
%   the individual. The clip file names are formed as
%   'IndividualsName_frame_XXXXX.jpg'
%
%   Input -----
%      'folder': folder containing the video frames
%      'bb_file': csv file with annotations (see create_annotated_video
%                 for the csv file format).
%
%========================================================================

% (c) Lucy Kuncheva                                                 ^--^
% 06.11.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%
if ~contains(bb_file,'.csv') % repare filename
    bb_file = [bb_file,'.csv'];
end

[Dn,Ds] = xlsread(bb_file);

Names = unique(Ds(:,1)); % names of the individuals (class labels)

t = dir(folder);
if ~exist([folder '_clips'],'dir')
    mkdir([folder '_clips'])
end

for i = 1:numel(Names) % Create subfolders
    if ~exist([folder, '_clips/',Names{i}],'dir')
        mkdir([folder, '_clips/',Names{i}])
    end
end

for i = 1:numel(t) - 2
    fn = t(i+2).name; % filename of the ith frame
    index = find(strcmp(Ds(:,6), fn)); % where in the table is frame i
    im = imread([folder,'/',fn]);
    
    % Parse the filename 'sceneXXXXX.jpg'
    frame_number = str2double(fn(6:10));
    fprintf('Frame: %5i\n',frame_number)
    
    if ~isempty(index)
        for j = 1:numel(index)
            clip_name = [folder, '_clips/',strtrim(Ds{index(j),1}),...
                '/',strtrim(Ds{index(j),1}),'_frame_',...
                sprintf('%05d',frame_number),'.jpg'];
            clip_im = imcrop(im,Dn(index(j),1:4));
            imwrite(clip_im,clip_name)
        end
    end
end

