# -*- coding: utf-8 -*-
"""
Created on Mon Apr 30 10:36:40 2018

@author: Shinelon
"""

from PIL import Image
import random

import Cross

ParentRoot = 'D:/KinshipVerification/Parents/'
ChildRoot = 'D:/KinshipVerification/Children/'

ParentSave = 'D:/MyKinFace/raw/parents/KinFaceCornell/'
ChildSave = 'D:/MyKinFace/raw/children/KinFaceCornell/'

ParentTxt = open('D:/MyKinFace/raw/parents/KinFaceCornell.txt', 'w')
ChildTxt = open('D:/MyKinFace/raw/children/KinFaceCornell.txt', 'w')

size = 143

for i in range(1, size + 1):
    num = ''
    if i < 10:
        num = '00'
    if i >= 10 and i < 100:
        num = '0'
    num += str(i)
    parentImg = Image.open(ParentRoot + 'Parent_' + num + '.jpg')
    parentImg.save(ParentSave + str(i) + '.jpg')
    ParentTxt.write('KinFaceCornell\\' + str(i) + '.jpg 1\n')
    childImg = Image.open(ChildRoot + 'Child_' + num + '.jpg')
    childImg.save(ChildSave + str(i) + '.jpg')
    ChildTxt.write('KinFaceCornell\\' + str(i) + '.jpg 1\n')
    
    ParentTxt.write('KinFaceCornell\\' + str(i) + '.jpg 0\n')
    ran = random.randint(1, size)
    while ran == i:
        ran = random.randint(1, size)
    ChildTxt.write('KinFaceCornell\\' + str(ran) + '.jpg 0\n')
    
ParentTxt.close()
ChildTxt.close()

Cross.cross('D:/MyKinFace/raw/parents/KinFaceCornell.txt', 'D:/MyKinFace/raw/parents/', 'KinFaceCornell', 5)
Cross.cross('D:/MyKinFace/raw/children//KinFaceCornell.txt', 'D:/MyKinFace/raw/children/', 'KinFaceCornell', 5)