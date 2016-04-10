#!/bin/sh
EMACS_PRIVATE=~/.emacs.d/private
if [ -d "$EMACS_PRIVATE" ]; then
    if [ -L "$EMACS_PRIVATE" ]; then
        # It is a symlink!
        echo removing symlink $EMACS_PRIVATE
        rm "$EMACS_PRIVATE"
    else
        # It's a directory!
        echo $EMACS_PRIVATE does not look like symlink
        exit
    fi
fi
echo linking $EMACS_PRIVATE
ln -sf --relative ./emacs/.emacs.d/private/ ~/.emacs.d/private
echo linking .spacemacs
ln -sf --relative ./emacs/.spacemacs ~/.spacemacs
