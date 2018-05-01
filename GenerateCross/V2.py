# -*- coding: utf-8 -*-
"""
Created on Sun Apr 29 23:02:48 2018

@author: Shinelon
"""
from PIL import Image
import random

import Cross

ChildRoot = 'D:/KinFace_V2/01/'
YoungRoot = 'D:/KinFace_V2/02/'
OldRoot = 'D:/KinFace_V2/03/'

ChildSave = 'D:/MyKinFace/raw/children/KinFaceV2/'
YoungSave = 'D:/MyKinFace/raw/parents/KinFaceV2/young/'
OldSave = 'D:/MyKinFace/raw/parents/KinFaceV2/old/'

YoungChildTxt = open('D:/MyKinFace/raw/children/KinFaceV2-Young.txt', 'w')
OldChildTxt = open('D:/MyKinFace/raw/children/KinFaceV2-Old.txt', 'w')

YoungTxt = open('D:/MyKinFace/raw/parents/KinFaceV2-Young.txt', 'w')
OldTxt = open('D:/MyKinFace/raw/parents/KinFaceV2-Old.txt', 'w')

size = 200

for i in range(1, size + 1):
    childImg = Image.open(ChildRoot + str(i) + '.jpg')
    childImg.save(ChildSave + str(i) + '.jpg')
    YoungChildTxt.write('KinFaceV2\\' + str(i) + '.jpg 1\n')
    OldChildTxt.write('KinFaceV2\\' + str(i) + '.jpg 1\n')
    youngImg = Image.open(YoungRoot + str(i) + '.jpg')
    youngImg.save(YoungSave + str(i) + '.jpg')
    YoungTxt.write('KinFaceV2\\young\\' + str(i) + '.jpg 1\n')
    oldImg = Image.open(OldRoot + str(i) + '.jpg')
    oldImg.save(OldSave + str(i) + '.jpg')
    OldTxt.write('KinFaceV2\\old\\' + str(i) + '.jpg 1\n')
    
    num = random.randint(1, size)
    while num == i:
        num = random.randint(1, size)
    YoungChildTxt.write('KinFaceV2\\' + str(i) + '.jpg 0\n')
    OldChildTxt.write('KinFaceV2\\' + str(i) + '.jpg 0\n')
    YoungTxt.write('KinFaceV2\\young\\' + str(num) + '.jpg 0\n')
    num = random.randint(1, size)
    while num == i:
        num = random.randint(1, size)
    OldTxt.write('KinFaceV2\\old\\' + str(num) + '.jpg 0\n')

YoungChildTxt.close()
OldChildTxt.close()
YoungTxt.close()
OldTxt.close()

Cross.cross('D:/MyKinFace/raw/parents/KinFaceV2-Old.txt', 'D:/MyKinFace/raw/parents/', 'KinFaceV2_Old', 5)
Cross.cross('D:/MyKinFace/raw/parents/KinFaceV2-Young.txt', 'D:/MyKinFace/raw/parents/', 'KinFaceV2_Young', 5)
Cross.cross('D:/MyKinFace/raw/children/KinFaceV2-Old.txt', 'D:/MyKinFace/raw/children/', 'KinFaceV2_Old', 5)
Cross.cross('D:/MyKinFace/raw/children/KinFaceV2-Young.txt', 'D:/MyKinFace/raw/children/', 'KinFaceV2_Young', 5)