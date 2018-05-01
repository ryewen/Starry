# -*- coding: utf-8 -*-
"""
Created on Tue May 01 14:59:01 2018

@author: Shinelon
"""

import os

txts = os.listdir('D:\\MyKinFace\\raw\\parents\\cross1')
name = open('D:\\MyKinFace\\names.txt', 'w')
for txt in txts:
    strs = txt.split('_train.txt')
    if len(strs) == 2:
        print strs[0]    #Dataset name
        name.write('\'' + strs[0] + '\'' + ' ')    #save name
        os.system('D:\\Starry\\train\\test_mean.bat ' + strs[0])    #use shell to create test means
name.close()