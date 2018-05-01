# -*- coding: utf-8 -*-
"""
Created on Tue May 01 11:30:06 2018

@author: Shinelon
"""
import os
import random

for i in range(1, 6):
    chifiles = os.listdir('D:\\MyKinFace\\raw\\children\\cross' + str(i))
    chiwrite = open('D:\\MyKinFace\\raw\\children\\cross' + str(i) + '\\' + 'train.txt', 'w')
    chilines = [];
    for txt in chifiles:
        strs = txt.split('_train.txt')
        if len(strs) == 2:
            read = open('D:\\MyKinFace\\raw\\children\\cross' + str(i) + '\\' + txt, 'r')
            strs = read.readlines()
            chilines += strs
            read.close()
    parfiles = os.listdir('D:\\MyKinFace\\raw\\parents\\cross' + str(i))
    parwrite = open('D:\\MyKinFace\\raw\\parents\\cross' + str(i) + '\\' + 'train.txt', 'w')
    parlines = [];
    for txt in parfiles:
        strs = txt.split('_train.txt')
        if len(strs) == 2:
            read = open('D:\\MyKinFace\\raw\\parents\\cross' + str(i) + '\\' + txt, 'r')
            strs = read.readlines()
            parlines += strs
            read.close()
    chirans = [];
    parrans = [];
    length = len(chilines)
    for j in range(0, length):
        size = len(chilines)
        ran = random.randint(0, size - 1)
        chirans += chilines.pop(ran)
        parrans += parlines.pop(ran)
    chiwrite.writelines(chirans)
    parwrite.writelines(parrans)
    chiwrite.close()
    parwrite.close()