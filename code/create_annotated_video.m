function create_annotated_video(image_folder, bb_file_name, label_flag)

%=======================================================================
%create_annotated_video Create an mp4 annotated video
%
%   create_annotated_video(image_folder, bb_file_name)
%   Create a video with bounding box annotations from a folder with images
%   and a csv file with bounding boxes
%
%   Input -----
%      'image_folder': folder with all images included as filenames in
%                      the respective column of the csv file with
%                      bounding boxes
%      'bb_file_name': csv file with the following structure:
%
%      identity,top_left_x,top_left_y,width,height, filename,  max_x,max_y
%
%      'label_flag': true for showing the label on the bb (default = true)
%      -------------------------------------------------------------------
%      For example:
%       Mahrez	   1059        85     221    312   frame1.jpg  1280  720
%
%   Output -----
%      a file with name Output.mp4 with the annotated video
%
%========================================================================

% Author: Lucy Kuncheva                                             ^--^
% 15.10.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%

clc, close all

if nargin == 2
    label_flag = true;
end

if ~contains(bb_file_name,'.csv') % repare filename
    bb_file_name = [bb_file_name,'.csv'];
end

[Dn,Ds] = xlsread(bb_file_name);
Names = unique(Ds(:,1)); % names of the individuals (class labels)

t = dir(image_folder);

figure('pos',[50,50,Dn(1,6),Dn(1,7)]);
%
% Prepare the new file.
vo = VideoWriter('Output.mp4','MPEG-4');
open(vo)

rng(1959)
co = rand(numel(Names),3)*0.3+0.7; % colours

% We assume that the files in folder image_folder are arranged as the
% consecutive frames in the video
for i = 1:numel(t) - 2
    fprintf('Frame: %5i\n',i)
    fn = t(i+2).name; % filename of the ith frame
    index = find(strcmp(Ds(:,6), fn)); % where in the table is frame i
    im = imread([image_folder,'/',fn]);
    
    hold on
    axes('pos',[0 0 1 1])
    imshow(im)
    
    if ~isempty(index)
        for j = 1:numel(index)
            % Plot labelled bounding box
            identity = find(strcmp(Names, Ds{index(j),1}));
            plot_lbb(Dn(index(j),1:4),...
                Names{identity},...
                co(identity,:),30,label_flag);
        end
    end
    drawnow
    
    currFrame = getframe(gca); % <<<<<
    size(currFrame)
    writeVideo(vo,currFrame); % <<<<<
    
    hold off
end

close(vo);

function t = plot_lbb(bb,st,co,pix,label_flag)
% Plot a labelled bounding box
% bb - region(rectangle position)
% str - string
% co - colour
% pix - pixel for the label

if nargin == 4
    label_flag = true;
end
rectangle('Pos',bb,'EdgeColor',co,...
    'linewidth',1)

if label_flag
    rectangle('Pos',[bb(1),bb(2),bb(3),pix],...
        'EdgeColor','none','FaceColor',co)
    t = text(bb(1)+0.1*pix,bb(2)+0.5*pix,st,'color','k','Visible','off');
    if t.Extent(3) < bb(3) && t.Extent(4) < pix
        t.Visible = 'on';
    end
end