function show_annotated_frame(im_folder,f_name, bb_file)
%=======================================================================
%show_annotated_frame Reads image 'f_name' from 'im_folder' and
%   displays the image with overlayed labelled bounding boxes. 
%   Annotations are in the bb_file csv file (see create_annotated_video
%   for the csv file format). 
%
%   Input -----
%      'im_folder': path to the images
%      'f_name': image name
%      'bb_file': csv file with annotations
%
%   Output -----
%      annotated plot
%
%========================================================================

% (c) Lucy Kuncheva                                                 ^--^
% 06.11.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%
if ~contains(bb_file,'.csv') % repare filename
    bb_file = [bb_file,'.csv'];
end

T = readtable(bb_file);
Dn(T(:,[2:5,7,8])) = table2array(T(:,[2:5,7,8]));
Ds = table2array(T(:,[1,6]));

figure('pos',[50,50,Dn(1,6),Dn(1,7)]);
im = imread([im_folder,'/',f_name]);
index = find(strcmp(Ds(:,2), f_name)); % where in the table is frame i
hold on, axes('pos',[0 0 1 1])
imshow(im)

rng(1959)
co = rand(numel(index),3)*0.3+0.7; % colours

if ~isempty(index)
    for j = 1:numel(index)
        % Plot labelled bounding box
        plot_lbb(Dn(index(j),1:4),...
            Ds{index(j),1}function show_annotated_frame(im_folder,f_name, bb_file)
%=======================================================================
%show_annotated_frame Reads image 'f_name' from 'im_folder' and
%   displays the image with overlayed labelled bounding boxes. 
%   Annotations are in the bb_file csv file (see create_annotated_video
%   for the csv file format). 
%
%   Input -----
%      'im_folder': path to the images
%      'f_name': image name
%      'bb_file': csv file with annotations
%
%   Output -----
%      annotated plot
%
%========================================================================

% (c) Lucy Kuncheva                                                 ^--^
% 06.11.2021 -----------------------------------------------------  \oo/
% -------------------------------------------------------------------\/-%
close all
if ~contains(bb_file,'.csv') % repare filename
    bb_file = [bb_file,'.csv'];
end

T = readtable(bb_file);
Dn(:,[1:4,6,7]) = table2array(T(:,[2:5,7,8]));
Ds = table2array(T(:,[1,6]));

figure('pos',[50,50,Dn(1,6),Dn(1,7)]);
im = imread([im_folder,'/',f_name]);
index = find(strcmp(Ds(:,2), f_name)); % where in the table is frame i
hold on, axes('pos',[0 0 1 1])
imshow(im)

rng(1959)
co = rand(numel(index),3)*0.3+0.7; % colours

if ~isempty(index)
    for j = 1:numel(index)
        % Plot labelled bounding box
        plot_lbb(Dn(index(j),1:4),...
            Ds{index(j),1}, co(j,:),30,1);
    end
end
, co(j,:),30,1);
    end
end
