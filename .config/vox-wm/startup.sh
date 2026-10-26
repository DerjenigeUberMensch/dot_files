#!/bin/bash

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=vox-wm
export XDG_SESSION_DESKTOP=vox-wm
export DESKTOP_SESSION=vox-wm


systemctl --user import-environment \
    DISPLAY \
    XAUTHORITY \
    XDG_SESSION_TYPE \
    XDG_CURRENT_DESKTOP \
    XDG_SESSION_DESKTOP \
    DESKTOP_SESSION

dbus-update-activation-environment --systemd \
    DISPLAY \
    XAUTHORITY \
    XDG_SESSION_TYPE \
    XDG_CURRENT_DESKTOP \
    XDG_SESSION_DESKTOP \
    DESKTOP_SESSION


# Sys
/usr/lib/polkit-kde-authentication-agent-1 &
xsettingsd &

# clipman destroys itself after 60s if no taskbar is detected... why
# xfce4-clipman &
parcellite -n &

# gnoem keyring setup manually
eval "$(/usr/bin/gnome-keyring-daemon --start --components=secrets)"
# ~/.config/xdg-desktop-portal/vox-wm-portals.conf
# [preferred]
# default=gtk
# org.freedesktop.impl.portal.Secret=gnome-keyring

# fix autostart desktop
dex --autostart --environment vox-wm &

udiskie &
dunst &
numlockx &

# setup auto-lcok screen
xss-lock -- xsecurelock &

# delay in holding down repeat
xset r rate 545 37 &
#desktop
xfdesktop --disable-wm-check &
# apps 
alttab -sc 0 -vp pointer &
picom &
