%name = 'KinFaceV2_Young';
%crossFeatures(name);
%nrml(name);

names = {'KinFaceCornell' 'KinFaceV2_Old' 'KinFaceV2_Young' 'KinFaceW-I_father-dau' 'KinFaceW-I_father-son' 'KinFaceW-I_mother-dau' 'KinFaceW-I_mother-son' 'KinFaceW-II_father-dau' 'KinFaceW-II_father-son' 'KinFaceW-II_mother-dau' 'KinFaceW-II_mother-son'};
for i = 1: size(names, 2)
    name = names{i};
    display(name);
    crossFeatures(name);
    nrml(name);
end