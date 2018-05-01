# -*- coding: utf-8 -*-
"""
Created on Mon Apr 30 23:27:47 2018

@author: Shinelon
"""

from PIL import Image
txt = open('D:\\MyKinFace\\raw\\nofaces.txt', 'r')
i = 1
for path in txt:
    img = Image.open(path.split('\n')[0])
    img.save('D:\\MyKinFace\\raw\\nofaces/' + str(i) + '.jpg')    #copy SeetaFace cant decete img
    i += 1
txt.close()

txt = open('D:\\MyKinFace\\raw\\nofaces.txt', 'r')
paths = txt.readlines()
txt.close()

txt = open('D:\\Starry\\GenerateCross\\FaceTools-master\\Output\\imagelist_point.list', 'r')
save = open('D:\\MyKinFace\\raw\\py.txt', 'w')
for s in txt:    #use FaceTool to decete img points
    strs = s.split('.jpg')
    index = int(strs[0].split('\\')[1])
    paths[index - 1] = paths[index - 1].split('\n')[0] + strs[1]
save.writelines(paths)
save.close()
txt.close()
