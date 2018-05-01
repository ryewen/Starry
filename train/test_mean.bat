echo %1

C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross1\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_child1
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross2\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_child2
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross3\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_child3
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross4\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_child4
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross5\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_child5

C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross1\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_parent1
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross2\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_parent2
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross3\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_parent3
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross4\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_parent4
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross5\%1_train.txt D:\MyKinFace\lmdb\test\%1_train_parent5

C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_child1 D:\MyKinFace\mean\test\%1_train_child1.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_child2 D:\MyKinFace\mean\test\%1_train_child2.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_child3 D:\MyKinFace\mean\test\%1_train_child3.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_child4 D:\MyKinFace\mean\test\%1_train_child4.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_child5 D:\MyKinFace\mean\test\%1_train_child5.binaryproto

C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_parent1 D:\MyKinFace\mean\test\%1_train_parent1.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_parent2 D:\MyKinFace\mean\test\%1_train_parent2.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_parent3 D:\MyKinFace\mean\test\%1_train_parent3.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_parent4 D:\MyKinFace\mean\test\%1_train_parent4.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_train_parent5 D:\MyKinFace\mean\test\%1_train_parent5.binaryproto

C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross1\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_child1
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross2\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_child2
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross3\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_child3
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross4\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_child4
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\children\ D:\MyKinFace\raw\children\cross5\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_child5

C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross1\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_parent1
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross2\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_parent2
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross3\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_parent3
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross4\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_parent4
C:\caffe-master\Build\x64\Release\convert_imageset.exe D:\MyKinFace\pre\parents\ D:\MyKinFace\raw\parents\cross5\%1_test.txt D:\MyKinFace\lmdb\test\%1_test_parent5

C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_child1 D:\MyKinFace\mean\test\%1_test_child1.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_child2 D:\MyKinFace\mean\test\%1_test_child2.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_child3 D:\MyKinFace\mean\test\%1_test_child3.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_child4 D:\MyKinFace\mean\test\%1_test_child4.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_child5 D:\MyKinFace\mean\test\%1_test_child5.binaryproto

C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_parent1 D:\MyKinFace\mean\test\%1_test_parent1.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_parent2 D:\MyKinFace\mean\test\%1_test_parent2.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_parent3 D:\MyKinFace\mean\test\%1_test_parent3.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_parent4 D:\MyKinFace\mean\test\%1_test_parent4.binaryproto
C:\caffe-master\Build\x64\Release\compute_image_mean.exe D:\MyKinFace\lmdb\test\%1_test_parent5 D:\MyKinFace\mean\test\%1_test_parent5.binaryproto
