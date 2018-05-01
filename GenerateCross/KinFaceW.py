# -*- coding: utf-8 -*-
"""
Created on Mon Apr 30 11:31:30 2018

@author: Shinelon
"""
import os
import scipy.io as scio
from PIL import Image

def copyCross(KFWRoot, version):
    matFiles = os.listdir(KFWRoot + '/meta_data')
    for matFile in matFiles:
        matName = os.path.basename(matFile)
        kinshipType = matName.split('_')[0]
        if kinshipType == 'fd':
            kinshipType = 'father-dau'
        if kinshipType == 'fs':
            kinshipType = 'father-son'
        if kinshipType == 'md':
            kinshipType = 'mother-dau'
        if kinshipType == 'ms':
            kinshipType = 'mother-son'
        
        mat = scio.loadmat(KFWRoot + '/meta_data/' + matName.split('.mat')[0])
        for pair in mat['pairs']:
            fold = pair[0][0][0]
            kinship = str(pair[1][0][0])
            parentName = pair[2][0]
            childName = pair[3][0]
            parentImg = Image.open(KFWRoot + 'images/' + kinshipType + '/' + parentName)
            parentImg = parentImg.resize((200, 200), Image.ANTIALIAS)
            parentImg.save('D:/MyKinFace/raw/parents/' + version + '/' + kinshipType + '/' + str(int(parentName.split('_')[1])) + '.jpg')
            childImg = Image.open(KFWRoot + 'images/' + kinshipType + '/' + childName)
            childImg = childImg.resize((200, 200), Image.ANTIALIAS)
            childImg.save('D:/MyKinFace/raw/children/' + version + '/' + kinshipType + '/' + str(int(childName.split('_')[1])) + '.jpg')
            for i in range(1, 6):
                if i != fold:
                    parentTrainTxt = open('D:/MyKinFace/raw/parents/cross' + str(i) + '/' + version + '_' + kinshipType + '_train.txt', 'a')
                    parentTrainTxt.write(version + '\\' + kinshipType + '\\' + str(int(parentName.split('_')[1])) + '.jpg ' + kinship + '\n')
                    childTrainTxt = open('D:/MyKinFace/raw/children/cross' + str(i) + '/' + version + '_' + kinshipType + '_train.txt', 'a')
                    childTrainTxt.write(version + '\\' + kinshipType + '\\' + str(int(childName.split('_')[1])) + '.jpg ' + kinship + '\n')
                    parentTrainTxt.close()
                    childTrainTxt.close()
                if i == fold:
                    parentTestTxt = open('D:/MyKinFace/raw/parents/cross' + str(i) + '/' + version + '_' + kinshipType + '_test.txt', 'a')
                    parentTestTxt.write(version + '\\' + kinshipType + '\\' + str(int(parentName.split('_')[1])) + '.jpg ' + kinship + '\n')
                    childTestTxt = open('D:/MyKinFace/raw/children/cross' + str(i) + '/' + version + '_' + kinshipType + '_test.txt', 'a')
                    childTestTxt.write(version + '\\' + kinshipType + '\\' + str(int(childName.split('_')[1])) + '.jpg ' + kinship + '\n')
                    parentTestTxt.close()
                    childTestTxt.close()

if __name__ == '__main__':
    for i in range(1, 6):
        chifiles = os.listdir('D:\\MyKinFace\\raw\\children\\cross' + str(i))
        for chifile in chifiles:
            strs = chifile.split('KinFaceW')
            if len(strs) == 2:
                os.remove('D:\\MyKinFace\\raw\\children\\cross' + str(i) + '\\' + chifile)
        parfiles = os.listdir('D:\\MyKinFace\\raw\\parents\\cross' + str(i))
        for parfile in parfiles:
            strs = parfile.split('KinFaceW')
            if len(strs) == 2:
                os.remove('D:\\MyKinFace\\raw\\parents\\cross' + str(i) + '\\' + parfile)
    copyCross('D:/KinFaceW-I/', 'KinFaceW-I')
    copyCross('D:/KinFaceW-II/', 'KinFaceW-II')