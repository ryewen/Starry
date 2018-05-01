# -*- coding: utf-8 -*-
"""
Created on Mon Apr 30 01:17:04 2018

@author: Shinelon
"""

import os

def cross(labelPath, saveRoot, name, n):
    labelTxt = open(labelPath, 'r')
    labels = labelTxt.readlines()
    size = len(labels)
    fold = size / n
    for i in range(0, n):
        crossPath = saveRoot + 'cross' + str(i + 1) + '/'
        mkdir(crossPath)
        trainTxt = open(crossPath + name + '_train.txt', 'w')
        testTxt = open(crossPath + name + '_test.txt', 'w')
        trainTxt.writelines(labels[0: i * fold])
        testTxt.writelines(labels[i * fold: (i + 1) * fold])
        trainTxt.writelines(labels[(i + 1) * fold: size])
    trainTxt.close()
    testTxt.close()
    labelTxt.close()
    
def mkdir(path):
    if os.path.exists(path):
        return
    else:
        os.makedirs(path)