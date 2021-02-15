#!/bin/sh

# Merge colors and settings
xrdb ~/.Xresources

## Force KDE environment when running i3
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
#XDG_CURRENT_DESKTOP=KDE
#export DESKTOP_SESSION=kde

source $HOME/.config/zsh/.zshenv
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

gpg-agent --daemon
gpg-connect-agent updatestartuptty /bye


exec awesome
