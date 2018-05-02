% keypoints = [36.6125 53.2543; 59.7063 50.9668; 49.0641 67.1442; 41.871 77.4409; 60.4653 75.2269 ];
% im = imread('D:\MyKinFace\raw\children\KinFaceCornell\1.jpg');
% figure(1);
% imshow(im);
% [img_cropped,trans_pt] = face_db_align_single_custom(im, keypoints);
% figure(2);
% imshow(img_cropped);

txt = fopen('D:\MyKinFace\raw\points_plus.txt', 'rt');

while feof(txt) ~= 1
    str = regexp(fgetl(txt), ' ', 'split');
    im = imread(str{1});
    pathes = regexp(str{1}, 'raw', 'split');
    path = ['D:\MyKinFace\pre', pathes{2}];
    points = [];
    for i = 1: 5
        points = [points; str2double(str{i * 2}), str2double(str{i * 2 + 1})];
    end
    [img_cropped,trans_pt] = face_db_align_single_custom(im, points);
    s = regexp(path, '\', 'split');
    dir = [];
    for i = 1: size(s, 2) - 1
        dir = [dir, s{i}, '\'];
    end
    mkdir(dir);
    imwrite(img_cropped, path);
end

fclose(txt);