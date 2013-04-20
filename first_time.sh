#!/bin/bash
if [ ! -e first_time.sh ]; then
    echo "execute from same directory as 'first_time.sh'"
    exit 1
fi
if [ ! -e ~/bin ]; then
    echo Making ~/bin
    mkdir ~/bin
fi
if [ ! -e ~/bin ]; then
    echo Making ~/src
    mkdir ~/src
fi
echo Copying files to bin directory
for file in bin/*; do
    if [ ! -e ~/$file ]; then
        echo Copying $file to bin
        cp $file ~/bin
    else
        echo ~/$file exists 
    fi
done
if [ -z "$(grep '\.shell_setup' ~/.bashrc 2> /dev/null)" ]; then
    echo "Adding initialization to .bashrc"
    echo "
cd ~/.shell_setup
source bashrc
cd ~/" >> ~/.bashrc
fi
