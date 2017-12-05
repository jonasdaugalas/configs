#!/bin/sh
EMACS_PRIVATE=~/.emacs.d/private
if [ -d "$EMACS_PRIVATE" ]; then
    if [ -L "$EMACS_PRIVATE" ]; then
        # It is a symlink!
        echo removing symlink $EMACS_PRIVATE
        rm "$EMACS_PRIVATE"
        echo linking $EMACS_PRIVATE
        ln -sf --relative ./emacs/.emacs.d/private/ ~/.emacs.d/private
        echo linking .spacemacs
        ln -sf --relative ./emacs/.spacemacs ~/.spacemacs

    else
        # It's a directory!
        echo $EMACS_PRIVATE does not look like symlink. Have a look!
        # exit
    fi
fi

echo linking config.fish
ln -sf --relative ./fish/config.fish ~/.config/fish/config.fish

AWESOME=~/.config/awesome
if [ ! -d "$AWESOME" ]; then
    mkdir $AWESOME
fi

if [ -d "$AWESOME/themes" ]; then
    echo Awesome themes already esist at $AWESOME/themes
else
    git clone --recursive https://github.com/lcpz/awesome-copycats.git 
    mv -bv awesome-copycats/* $AWESOME; rm -rf awesome-copycats
fi

if [ -f "$AWESOME/rc.lua" ]; then
    echo removing $AWESOME/rc.lua
    rm "$AWESOME/rc.lua"
fi
echo linking $AWESOME/rc.lua
ln -sf --relative ./awesome/rc.lua $AWESOME/rc.lua

