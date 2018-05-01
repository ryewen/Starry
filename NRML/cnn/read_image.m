function image = read_image(path)
    im = caffe.io.load_image(path);
    image = [];
    a = size(im);
    if size(a, 2) == 3
        image = im;
    else
        image = zeros(size(im, 1), size(im, 2), 3);
        image(:, :, 1) = im(:, :);
        image(:, :, 2) = im(:, :);
        image(:, :, 3) = im(:, :);
    end