

# Aliases




#find . -type f -exec sed -i 's/abc/abcd/g' {} \;




alias lsd="ls --color=auto -a && pwd"
alias ls="ls --color=auto --classify --tabsize=0 --group-directories-first --literal --show-control-chars ${colorflag} --human-readable -a --hyperlink"
alias dc="cd"
alias s="sudo"
alias grep='grep --color=auto'
alias greps='grep -re'
alias seek="find . | grep "
alias seeka='find | grep "f[[:alnum:]]\.frm"'


#wifi
alias publicwifi='echo "" | sudo tee "/etc/NetworkManager/conf.d/dns.conf" && sleep 1 &&  sudo systemctl restart NetworkManager.service'
alias homewifi='echo "[main]" | sudo tee "/etc/NetworkManager/conf.d/dns.conf"  && echo "dns=none" | sudo tee -a "/etc/NetworkManager/conf.d/dns.conf" && echo "[main]" | sudo tee "/etc/resolv.conf" && echo "nameserver 1.1.1.1" | sudo tee -a "/etc/resolv.conf" '

alias pacget='sudo pacman -S'
alias pacsync="printf 'Syncing...\n' && yes | sudo pacman -Syu && yes | yay -Syu && utor && flatpak update"
alias pacdel='sudo pacman -Rcns'
alias pacdeldep='sudo pacman -Qtdq && sudo pacman -Rns - && sudo pacman -Qqd && sudo  pacman -Rsu --print -'
alias paccache='sudo ls /var/cache/pacman/pkg/ | wc -l &&  du -sh /var/cache/pacman/pkg/; '
alias pacdelcache='sudo paccache -r'
alias pacdelcacheall='sudo paccache -rk 1 && sudo paccache -ruk0'
alias pacreboot="sudo rm -R /var/lib/pacman/sync && sleep 1 && sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo -E pacman -Syu && sudo pacman -Syu"
alias pacdelold='sudo pacman -Sc'
alias pac="sudo pacman"

alias yayget='yay -S'
alias yaysync='yay -Syu'
alias yaydel='yay -Rcns'

alias rvim="vim"
alias rvi="vi"
alias vim="nvim"
alias vi="nvim"
alias neovim="nvim"
alias mkf="touch"
alias o="touch"
alias :q="exit"
alias quit="exit"
alias pipget="sudo pacman -S python-" | xargs

#boot
alias regenimg="sudo mkinitcpio -p linux"
alias regensys="sudo mkinitcpio -p linux && sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"


alias sbsh=". ~/.bashrc"
alias pbsh=". ~/.bash_profile"
alias nnx="nvim ~/.xinitrc"
alias aliasy="nvim ~/.bash_aliases"
alias exporty="nvim ~/.bash_exports"
alias vimconf="cd ~/.config/nvim/lua/core/ && nvim ~/.config/nvim/lua/core/"
alias nvimconf="cd ~/.config/nvim/lua/core && nvim ~/.config/nvim/lua/core/"

alias finfo="exiftool"
alias screenshot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'
alias sscrot="screenshot"
alias scrot="screenshot"
alias setbackground="feh --bg-scale"
alias setwallpaper="feh --bg-scale"
alias settty="chvt"
alias setty="chvt"
alias changetty="settty"

alias ccmk="sudo make install"
alias make="make -j$(nproc)"
alias m="clear && make"
alias mk="make"
alias xmk="sudo make clean install && startx"
alias frm="astyle"
alias px="pipx install"

alias x="startx"
alias X="startx"
alias disablevmsupport="sudo systemctl disable libvirtd.service"
alias startvmsupport="sudo systemctl start libvirtd.service"
alias enablevmsupport="sudo systemctl start libvirtd.service && sudo systemctl enable libvirtd.service"
alias train="sl -e"
alias sl="sl -e"
alias downgrade="sudo downgrade"
alias vidseek='yt-dlp --console-title --extract-audio --audio-format=mp3 --no-keep-video --embed-thumbnail --embed-metadata -o "%(title)s.%(ext)s"'
alias vidget="cd ~/Music/MMusic/Playlists && vidseek"
alias music="cd ~/Music/MMusic/Playlists && vlc ."

alias ~="~/"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd $HOME" # `cd` is probably faster to type though
alias -- -="cd -"
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias ln='ln -i'
alias mv="mv -iv"
alias mov="mv"
alias smv="s mv"
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -vIi --preserve-root'  
# Safetynets [Parenting changing perms on / #]
alias chown='chown -v --preserve-root'
alias chmod='chmod -v --preserve-root'
alias chgrp='chgrp --preserve-root'
alias chmox="chmod +x --preserve-root"
# ------------------------------------------------------------------
# File managements
# ------------------------------------------------------------------
alias df='df -h'
alias du='du -hs'
alias fs="stat -f \"%z bytes\""    # File size
#lsblk
alias lsblkid="lsblk -o name,label,fstype,size,uuid --noheadings" #: A more descriptive, yet concise lsblk.
alias blkid_="blkid -o list"
#file sz
alias new="/usr/bin/ls -lth | head -15"    # a quick glance at the newest files.
alias big="command du -a -BM | sort -n -r | head -n 10" # Find 10 largest files in pwd.

#files
alias thunar="thunar ."
# ------------------------------------------------------------------
# Networking and IP addresses
# ------------------------------------------------------------------
alias ping="ping -c 5"
alias ports='sudo netstat -vatnp'
alias ifconfig="ip -c a | sed -e 's/\// \//g'"
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
#alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias ports='sudo lsof -nP 2>/dev/null | grep LISTEN | sed -re "s/ +/ /g" | cut -d " " -f 1,3,9 | sort -u | column -t'

# https://github.com/terminalforlife/BashConfig/
alias joke='command wget -U "curl/7.55.1" -o /dev/null -qO - https://icanhazdadjoke.com || printf "No jokes today"; echo'
# Show which commands you use the most
alias freq='cut -f1 -d" " $HOME/.bash_history | sort | uniq -c | sort -nr | head -n 30'
alias sigkill="killall -9 -iv"
# Potentially useful option for viewing the kernel log.
alias klog="dmesg -t -L=never -l emerg,alert,crit,err,warn --human --nopager"
alias where=which # sometimes i forget

# Add an "alert" alias for long running commands.
# Usage example: $ sleep 5; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Always enable colored `grep` output
if [ -x /usr/bin/dircolors ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep="grep -sI --color=auto --exclude-dir=__pycache__"
  alias grepi="grep -i --color=auto --exclude-dir=__pycache__"
  alias fgrep="fgrep --color=auto --exclude-dir=__pycache__"
  alias egrep="egrep --color=auto --exclude-dir=__pycache__"
fi


alias c="clear"
alias time="timedatectl"
alias service="sudo systemctl"
alias :qq="killall -iv"
alias prof="perf"
alias prf="perf"
alias :qqf="killall -SIGKILL -iv" # Send Kill process no matter what
alias qqf=":qqf" # Send kill process signal (process can do stuff then shutdown safely)
alias qq="killall -iv"
alias stop=":qqf"
alias fstop=":qqf"
alias nobody="> /dev/null 2>&1 &" # useless
alias exe="chmod +x" # set file to executable
alias unexe="chmod -x"
alias dirsize="du -hs" #folder size
alias dirsz="du -hs"
alias fsize="wc -c" # fiel size
alias fsz="wc -c"
alias fzs="fsz"
alias fz="fsz"
alias sz="fsz"
alias sizeof="wc"
alias ronly="chmod -R ugo-w" # set file to be read-only
alias frm="astyle" # useless
alias display="xrandr -q | grep 'connected'"
alias b="xrandr --output VGA-1 --brightness "
alias ffwatch="watch cat"
alias fwatch="tail -F" # see file changes happening all the time
alias debugger="gdbgui"


# Git 
#
alias gstart="ssh-add"
alias gdiff="git diff"
alias gdiffs="git diff --stat"
alias gadd="git add"
alias grm="git rm --cached"
alias grmf="git rm"
alias gnew="git branch "
alias gdel="gnew -d"
alias gdelf="gnew -D"
alias gmv="git checkout "
alias gpush="git push origin HEAD"
alias gpull="git pull --rebase"
alias gpullr="git rebase --abort"
alias gcreate="git branch "
alias glie="git commit -S -m"
alias glier="git commit --amend -m"


alias maek="make"
alias mkae="make"
alias resetsafe="faillock --user $USER --reset" # reset password lock
alias pcheck="ping google.com" # check internt connection
alias zipdir="zip -r"
alias countdown="echo '3' && sleep 1 && echo '2' && sleep 1 && echo '1' && sleep 1"
alias poweroff=" yes | sudo pacman -Syu && yes | yay -Suu && printf 'ctrl-c to stop\n' && countdown && shutdown now"
alias POWEROFF="poweroff"
alias powerdown="poweroff"
alias shutoff="poweroff"
alias xe="export DISPLAY=:0 && Xephyr :1 -ac c 25 +xinerama -resizeable -screen 680x480 &"
alias xem="export DISPLAY=:0 && Xephyr +xinerama -resizeable +extension RANDR -screen 400x600+0+0 -screen 400x600+800+0 -ac :1 &"
alias xdwm="export DISPLAY=:1 && gdb dwm && export DISPLAY=:0"
alias xend="export DISPLAY=:0"
alias xdwmf="export DISPLAY=:1"
alias exerec="valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes $EXE"
alias exepb="kcachegrind"
alias valcheck='valgrind -s --quiet --track-fds=yes --error-limit=no --vgdb=full --leak-check=full --show-leak-kinds=all --leak-resolution=high --track-origins=yes --verbose --log-file="valgrind.txt"'
alias windata="wmctrl -l | awk '{print $1}' | xargs -I{} sh -c 'echo \"Properties for window ID: {}\"; xprop -id {}; echo \"-------------------------------------\"'"
alias winshow='for win in $(wmctrl -l | awk "{print \$1}"); do echo "Window ID: $win"; xprop -id $win; done'
alias ducks="du -sckh * | sort -rn | head"
alias ducksa="du -cksh *"

#xdotool search --onlyvisible --class '' getwindowname %@ 2>/dev/null | while read -r line; do echo "Window: $line"; xprop -id "$(xdotool search --name "$line" | head -n 1)" | grep -i protocol; echo "------------------------"; done
alias fixpip="sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old"
PS1='[\u@\h \W]\$ '


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
