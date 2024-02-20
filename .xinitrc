exec nitrogen --restore &
exec rivalcfg -S 600 -s 600 &
#exec compfy --daemon &

#exec keepassxc &
#exec numlockx &

# Bar for DWM
exec ~/programs/suckless/dwm-bar/dwm_bar.sh &
#exec dwmblocks &



exec xbindkeys -f /home/abbas/.config/xbindkeys/xbindkeysrc &
exec nicotine &
exec keepassxc &


#exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &


# nmcli connection up vultr-vpn &

exec ~/scripts/startdwm.sh

