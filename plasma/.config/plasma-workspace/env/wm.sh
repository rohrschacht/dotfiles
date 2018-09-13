# Disable KWin and use i3gaps as WM
export KDEWM=/usr/bin/i3

# Compositor (Animations, Shadows, Transparency)
# xcompmgr -C
compton -cCfb --backend glx --vsync opengl --config ~/.config/compton.conf
