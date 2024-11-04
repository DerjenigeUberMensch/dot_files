#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

feh --bg-scale ~/SystemFiles/Wallpapers/1705983272910499.jpg &
mpv ~/SystemFiles/Sounds/system_boot/windows95_startup_hifi.wav &
numlockx &
#picom -c -f -i -e & 
#exec budgie-desktop
#exec i3
kdeconnect-app &
picom &
exec vox-wm >> ~/log.txt 2>> ~/err.txt
#exec i3
