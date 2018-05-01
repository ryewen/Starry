txt = fopen('D:\MyKinFace\raw\py.txt', 'rt');
lines = [];
global X;
while feof(txt) ~= 1
    str = regexp(fgetl(txt), '\n', 'split');
    %strs = [strs, char(13, 10)', str{1}];
    display(str{1});
    strs = regexp(str{1}, '.jpg', 'split');
    a = '';
    b = strs{2};
    if size(a) == size(b)
        X = [];
        click_plot(str{1});   %show img and use mouse to click face points
        input('input:');    %enter to next img
        lines = [lines, char(13, 10)', str{1}, ' ', X];
        display(X);
    else
        lines = [lines, char(13, 10)', str{1}];
    end
end
out = fopen('D:\MyKinFace\raw\matlab.txt', 'w');
fprintf(out, '%s', lines);
fclose(out);
fclose(txt);
clear global;

