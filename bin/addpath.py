#!/usr/bin/env python3
import sys
import os
import argparse

def add_path(path, new_path, pos=None):
    paths = path.split(":")
    if new_path in paths:
        return path
    if pos == None:
        pos = len(paths)
    paths.insert(pos,new_path)
    return ":".join(paths)

def add_paths(path, pathfile):
    paths = path.split(":")
    paths_set = set(paths)
    new_paths = []
    with open(pathfile) as new_paths_file:
        for line in new_paths_file.read().split("\n"):
            line = os.path.expanduser(line)
            if line in paths_set:
                continue
            if line.strip() == "":
                continue
            new_paths.append(line)
    return ":".join(new_paths + paths)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pathfile")
    parser.add_argument("--path", default=None)
    parser.add_argument("--at", type=int, default=0)
    options = parser.parse_args()
    if not options.path and not options.pathfile:
        parser.print_help()
        return
    if options.pathfile:
        print(add_paths(os.environ["PATH"], options.pathfile))
    else:
        print(add_path(os.environ["PATH"], options.path, options.at))
main()
