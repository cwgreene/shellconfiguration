#!/usr/bin/env python
import sys
import os

def add_path(path, new_path):
    paths = path.split(":")
    if new_path in paths:
        return path
    paths.append(new_path)
    return ":".join(paths)
def main():
    print add_path(os.environ["PATH"], sys.argv[1])
main()
