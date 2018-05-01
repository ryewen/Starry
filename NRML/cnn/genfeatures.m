caffe.set_mode_gpu();
caffe.set_device(0);

net = caffe.Net('C:\caffe-master\examples\Kinship_demo\test.prototxt', 'D:\MyKinFace\model\1_iter_100000.caffemodel', 'test');

xa = zeros(500, 80);
xb = zeros(500, 80);
idxa = zeros(500, 1);
idxb = zeros(500, 1);
matches = zeros(500, 1);
fold = zeros(500, 1);
nfold = 5;
txt_left = fopen('D:\MyKinFace\data\left\train.txt', 'rt');
txt_right = fopen('D:\MyKinFace\data\right\train.txt', 'rt');
rows = size(xa);
rows = rows(1);
i = 1;
while feof(txt_left) ~= 1
    strs = regexp(fgetl(txt_left), ' ', 'split');
    display(strs);
    im_left = readImage(strcat('D:\MyKinFace\data\left\train\', strs{1}));
    idxa(i, 1) = i;
    matches(i, 1) = strs{2} == '1';
    im_data = caffe.io.load_image(strcat('D:\MyKinFace\data\left\train\', strs{1}));
    net.blobs('data').set_data(im_data - 127.5);
    net.forward_prefilled();
    xa(i, :) = net.blobs('feat').get_data();
    fold(i, 1) = fix((i - 1) / (rows / nfold)) + 1;
    
    strs = regexp(fgetl(txt_right), ' ', 'split');
    display(strs);
    idxb(i, 1) = i;
    im_right = readImage(strcat('D:\MyKinFace\data\right\train\', strs{1}));
    im_data = caffe.io.load_image(strcat('D:\MyKinFace\data\right\train\', strs{1}));
    net.blobs('data').set_data(im_data - 127.5);
    net.forward_prefilled();
    xb(i, :) = net.blobs('feat').get_data();
    if i >= 500
        break;
    end
    i = i + 1;
end

fclose(txt_left);
fclose(txt_right);

matches = logical(matches);
save features xa xb idxa idxb matches fold nfold
