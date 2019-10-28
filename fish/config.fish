set PATH $PATH /usr/local/go/bin $HOME/local/bin $HOME/.yarn/bin $HOME/go/bin
set PATH (printf '%s\n' $PATH | sort -u)

set PKG_CONFIG_PATH $PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
set PKG_CONFIG_PATH (printf '%s\n' $PKG_CONFIG_PATH | sort -u)

set LD_LIBRARY_PATH /usr/local/lib
alias python=python3
