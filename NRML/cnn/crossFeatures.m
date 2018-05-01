function crossFeatures(name)

nfold = 5;

for i = 1:nfold
    caffe.set_mode_gpu();
    caffe.set_device(0);
    net = caffe.Net('C:\caffe-master\examples\Kinship_demo\test.prototxt', strcat('D:\MyKinFace\model\new', mat2str(i), '_iter_800.caffemodel'), 'test');
    parentTrainTxt = fopen(strcat('D:\MyKinFace\raw\parents\cross', mat2str(i), '\', name, '_train.txt'), 'rt');
    childTrainTxt = fopen(strcat('D:\MyKinFace\raw\children\cross', mat2str(i), '\', name, '_train.txt'), 'rt');
    xa = [];
    xb = [];
    parentMean = caffe.io.read_mean(strcat('D:\MyKinFace\mean\test\', name, '_train_parent', mat2str(i), '.binaryproto'));
    childMean = caffe.io.read_mean(strcat('D:\MyKinFace\mean\test\', name, '_train_child', mat2str(i), '.binaryproto'));
    while feof(parentTrainTxt) ~= 1
        parentStrs = regexp(fgetl(parentTrainTxt), ' ', 'split');
        childStrs = regexp(fgetl(childTrainTxt), ' ', 'split');
        if parentStrs{2} == '0'
            continue;
        end
        image = read_image(strcat('D:\MyKinFace\pre\parents\', parentStrs{1}));
        net.blobs('data_l').set_data((image - parentMean) * 0.0078125);
        image = read_image(strcat('D:\MyKinFace\pre\children\', childStrs{1}));
        net.blobs('data_r').set_data((image - childMean) * 0.0078125);
        net.forward_prefilled();
        feature = net.blobs('feat_l').get_data();
        xa = [xa; feature'];
        feature = net.blobs('feat_r').get_data();
        xb = [xb; feature'];
    end
    save(strcat(name, '_cross_train_', mat2str(i)), 'xa', 'xb');
    fclose(parentTrainTxt);
    fclose(childTrainTxt);
    parentTestTxt = fopen(strcat('D:\MyKinFace\raw\parents\cross', mat2str(i), '\', name, '_test.txt'), 'rt');
    childTestTxt = fopen(strcat('D:\MyKinFace\raw\children\cross', mat2str(i), '\', name, '_test.txt'), 'rt');
    xa = [];
    xb = [];
    matches = [];
    parentMean = caffe.io.read_mean(strcat('D:\MyKinFace\mean\test\', name, '_test_parent', mat2str(i), '.binaryproto'));
    childMean = caffe.io.read_mean(strcat('D:\MyKinFace\mean\test\', name, '_test_child', mat2str(i), '.binaryproto'));
    while feof(parentTestTxt) ~= 1
        parentStrs = regexp(fgetl(parentTestTxt), ' ', 'split');
        childStrs = regexp(fgetl(childTestTxt), ' ', 'split');
        image = read_image(strcat('D:\MyKinFace\pre\parents\', parentStrs{1}));
        net.blobs('data_l').set_data((image - parentMean) * 0.0078125);
        image = read_image(strcat('D:\MyKinFace\pre\children\', childStrs{1}));
        net.blobs('data_r').set_data((image - childMean) * 0.0078125);
        net.forward_prefilled();
        feature = net.blobs('feat_l').get_data();
        xa = [xa; feature'];
        feature = net.blobs('feat_r').get_data();
        xb = [xb; feature'];
        match = parentStrs{2} == '1';
        matches = [matches; match];
    end
    matches = logical(matches);
    save(strcat(name, '_cross_test_', mat2str(i)), 'xa', 'xb', 'matches');
    fclose(parentTestTxt);
    fclose(childTestTxt);
    caffe.reset_all();
end