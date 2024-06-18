# Set Wallpaper
exec nitrogen --restore &

# Set mouse dpi
exec rivalcfg -S 500 -s 500 &
#exec compfy --daemon &

#exec numlockx &

# Bar for DWM
exec ~/programs/suckless/dwm-bar/dwm_bar.sh &

# set repeat rate
xset r rate 300 50 &

# Keybinds 
exec xbindkeys -f /home/abbas/.config/xbindkeys/xbindkeysrc &

# Soulseek
exec nicotine &

# Email
exec thunderbird &

# Terminal Colours
xrdb -merge ~/.Xresources &

# Microphone Filter
noisetorch &
 
# Policy Kit (Used for file manager)
lxqt-policykit-agent &

# Control lights on computer
# openrgb &
#
source ~/scripts/fix_mouse_sens.sh &



exec ~/scripts/startdwm.sh

