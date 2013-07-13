#!/usr/bin/env python
import sys
import os

def add_path(path, new_path, pos=None):
    paths = path.split(":")
    if new_path in paths:
        return path
    if pos == None:
        pos = len(paths)
    paths.insert(pos,new_path)
    return ":".join(paths)

def main():
    path = ""
    if len(sys.argv) >= 2:
        path = os.path.abspath(sys.argv[1])
    if len(sys.argv) == 2:
        print add_path(os.environ["PATH"], sys.argv[1])
    elif len(sys.argv) == 3:
        print add_path(os.environ["PATH"], sys.argv[1], int(sys.argv[2]))
main()
