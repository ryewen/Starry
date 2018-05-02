# -*- coding: utf-8 -*-
"""
Created on Wed May 02 11:11:36 2018

@author: Shinelon
"""

totals = {}
total = open('D:\\MyKinFace\\raw\\points.txt', 'r')
for line in total:
    strs = line.split(' ')
    pointstr = ''
    for i in range(0, 10):
        pointstr += strs[i + 1] + ' '
    totals[strs[0]] = pointstr
total.close()

save = open('D:\\MyKinFace\\raw\\points_plus.txt', 'w')
raw = open('D:\\MyKinFace\\raw\\points2.txt', 'r')
for line in raw:
    strs = line.split(' ')
    if len(strs) == 2:
        line = strs[0] + ' ' + totals[strs[0]].split('\n')[0] + '\n'
    save.write(line)
raw.close()
save.close()