#!/bin/sh
EMACS_PRIVATE=~/.emacs.d/private
if [ -d "$EMACS_PRIVATE" ]; then
    if [ -L "$EMACS_PRIVATE" ]; then
        # It is a symlink!
        echo removing symlink $EMACS_PRIVATE
        rm "$EMACS_PRIVATE"
    else
        # It's a directory!
        echo $EMACS_PRIVATE does not look like symlink. Have a look. Exiting...
        exit
    fi
fi
echo linking $EMACS_PRIVATE
ln -sf --relative ./emacs/.emacs.d/private/ ~/.emacs.d/private

echo linking .spacemacs
ln -sf --relative ./emacs/.spacemacs ~/.spacemacs

echo linking config.fish
ln -sf --relative ./fish/config.fish ~/.config/fish/config.fish

AWESOME=~/.config/awesome
if [ -d "$AWESOME" ]; then
    if [ -L "$AWESOME" ]; then
        # It is a symlink!
        echo removing symlink $AWESOME
        rm "$AWESOME"
    else
        # It's a directory!
        echo $AWESOME does not look like symlink. Have a look. Exiting...
        exit
    fi
fi
echo linking $AWESOME
ln -sf --relative ./awesome/ ~/.config/awesome
