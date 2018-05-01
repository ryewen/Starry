function click_plot(path)
a = imread(path);
imshow(a);
set(gcf,'WindowButtonDownFcn',{@ButttonDownFcn});

% 回调函数
function ButttonDownFcn(src,event)
pt = get(gca,'CurrentPoint');
width  = round(pt(1,1));  %横轴坐标
height = round(pt(1,2));  %纵轴坐标
global X;
X = [X, mat2str(width), ' ', mat2str(height), ' '];