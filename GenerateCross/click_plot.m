function click_plot(path)
a = imread(path);
imshow(a);
set(gcf,'WindowButtonDownFcn',{@ButttonDownFcn});

% �ص�����
function ButttonDownFcn(src,event)
pt = get(gca,'CurrentPoint');
width  = round(pt(1,1));  %��������
height = round(pt(1,2));  %��������
global X;
X = [X, mat2str(width), ' ', mat2str(height), ' '];