#!/usr/bin/python3

import sys

protoList = []

if len(sys.argv) is 1:
    exit()
for filename in sys.argv:
    if filename != sys.argv[0]:
        with open(filename, 'r') as fd:
            for line in fd:
                if line[0] in "sfuciltugv":
                    if "static" not in line[:6]:
                        line = line[:-1] + ';'
                        protoList.append(line)

maxTab = 0
for line in protoList:
    lineTab = 0
    for c in line:
        if c == '\t':
            lineTab += 1
    if lineTab > maxTab:
        maxTab = lineTab
for pin, line in enumerate(protoList):
    lineTab = 0
    for c in line:
        if c is '\t':
            lineTab += 1
    if lineTab < maxTab:
        index = line.find('\t')
        x = 0
        if index <= 3:
            x = 1
        protoList[pin] = line[:index] + (maxTab - lineTab + x) * '\t' + line[index:]

for proto in protoList:
    print(proto)
