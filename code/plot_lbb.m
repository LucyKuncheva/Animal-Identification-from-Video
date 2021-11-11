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