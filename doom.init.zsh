#!/usr/bin/zsh

stow doom
mkdir -p $HOME/org
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
