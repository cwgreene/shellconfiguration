#!/bin/zsh
echo Changing current directory to $(dirname $0)
cd $(dirname $0)

function warn() {
    echo $(tput setaf 3)$*$(tput sgr 0)
}

function success() {
    echo $(tput setaf 2)$*$(tput sgr 0)
}

if [ ! -e ~/bin ]; then
    success Making ~/bin
    mkdir ~/bin
else
    warn ~/bin already created. 
fi
if [ ! -e ~/src ]; then
    success Making ~/src
    mkdir ~/src
else
    warn ~/src already created.
fi
echo Copying files to bin directory
for file in bin/*; do
    if [ ! -e ~/$file ]; then
        success Copying $file to bin
        cp $file ~/bin
    else
        warn ~/$file exists 
    fi
done
if [ -z "$(grep '\.shell_setup' ~/.zshrc 2> /dev/null)" ]; then
    echo "Adding initialization to .zshrc"
    echo "
pushd ~/.shell_setup > /dev/null
source zshrc
popd > /dev/null" >> ~/.zshrc
else
    warn ~/.zshrc already setup
fi
