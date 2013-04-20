#!/bin/bash
mkdir ~/bin
mkdir ~/src
mkdir ~/.shell_setup
cp * ~/.shell_setup
cp bin/* ~/bin
echo "
cd ~/.shell_setup
source bashrc
cd ~/
" >> ~/.bashrc
