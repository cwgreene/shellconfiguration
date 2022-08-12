#!/usr/bin/env python3
import sys
import os

def del_path(path, new_path):
    paths = path.split(":")
    if new_path not in paths:
        return path
    paths.remove(new_path)
    return ":".join(paths)
def main():
    print(del_path(os.environ["PATH"], sys.argv[1]))
main()
