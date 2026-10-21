

# Aliases




#find . -type f -exec sed -i 's/abc/abcd/g' {} \;




alias lsf="ls"
alias lsd="ls --color=auto -a && pwd"
alias ls="ls --color=auto --classify --tabsize=0 --group-directories-first --literal --show-control-chars ${colorflag} --human-readable -a --hyperlink"
alias dc="cd"
alias grep='grep --color=auto'
alias greps='grep -re'
alias seek="find . | grep "
alias seeka='find | grep "f[[:alnum:]]\.frm"'

alias swap="exch"

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
alias cmaker="cmake --build build"
alias cmakeb="rm -rf build && cmake -S . -B build -G Ninja && cmake --build build"
alias cmakei="cmake -S .. -B . -G Ninja"
alias frm="astyle"
alias py="python"
alias py3="python3"
alias px="pipx install"

alias x="startx"
alias X="startx"
alias disablevmsupport="sudo systemctl disable libvirtd.service"
alias startvmsupport="sudo systemctl start libvirtd.service"
alias enablevmsupport="sudo systemctl start libvirtd.service && sudo systemctl enable libvirtd.service"
alias homeshutdown="while true; do systemctl sleep; echo 'Dormiendo....'; sleep 17; done"
alias homesleep="homeshutdown"
alias train="sl -e"
alias sl="sl -e"
alias downgrade="sudo downgrade"
alias vidseek='yt-dlp --console-title --extract-audio --audio-format=mp3 --no-keep-video --embed-thumbnail --embed-metadata -o "%(title)s.%(ext)s"'

alias ~="~/"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd $HOME" # `cd` is probably faster to type though
alias -- -="cd -"
alias mkdir="mkdir -pv"
alias cpf="cp"
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
alias localip="ip -4 -brief addr show scope global"
alias publicip="curl -fsS https://api.ipify.org; echo"
alias myip="localip"
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
alias whereami="pwd"

# Add an "alert" alias for long running commands.
# Usage example: $ sleep 5; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias dircnames="find . -maxdepth 1 -type f -printf "%f\n" > _dir_names.txt"

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
alias sysservice="sudo systemctl"
alias service="sudo systemctl"
alias showboottime="systemd-analyze blame"
alias boottime="systemd-analyze"
alias wifishow="nmcli device show"
alias s="sudo"
#alias startrig="exec sudo ~/xmrig/xmrig-6.20.0/xmrig && sudo sudo cpulimit --limit=30 -i --exe=xmrig"
#alias killrig="sudo killall xmrig"
alias :qq="killall -iv"
alias prof="perf"
alias prf="perf"
alias :qqf="killall -SIGKILL -iv" # Send Kill process no matter what
alias qqf=":qqf" # Send kill process signal (process can do stuff then shutdown safely)
alias qq="killall -iv"
alias stop=":qqf"
alias fstop=":qqf"
alias exe="chmod +x" # set file to executable
alias unexe="chmod -x"
alias dirsize="du -hs" #folder size
alias dirsz="dirsize"
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
alias backtrace="coredumpctl debug"

# Git 
#
alias gstart="ssh-add"
alias gdiff="git diff"
alias gdiffs="git diff --stat"
alias gdiffslf="git diff origin"
alias gadd="git add"
alias grm="git rm --cached"
alias grmf="git rm"
alias gslf="git branch"
alias gnew="git switch -c"
alias gdel="git branch -d"
alias gdelf="git branch -D"
alias gmv="git checkout "
alias gpush="git push origin HEAD"
alias gpull="git pull --rebase"
alias gpullr="git rebase --abort"
alias gcreate="git branch "
alias glie="git commit -S -m"
alias glier="git commit --amend -m"

# Roblox roblox boblox
alias vinegar="flatpak run app/org.vinegarhq.Vinegar/x86_64/stable"

alias maek="make"
alias mkae="make"
alias resetsafe="faillock --user $USER --reset" # reset password lock
alias pcheck="ping google.com" # check internt connection
alias zipdir="zip -r"
alias countdown="echo '3' && sleep 1 && echo '2' && sleep 1 && echo '1' && sleep 1"
alias poweroff="systemctl poweroff"
alias POWEROFF="poweroff"
alias powerdown="poweroff"
alias shutoff="poweroff"
alias xe="export DISPLAY=:0 && Xephyr :1 -ac c 25 +xinerama -resizeable -screen 680x480 &"
alias xe3='export DISPLAY=:0 && Xephyr :1 -ac c 25 +xinerama -resizeable -screen 680x480 -origin 680,0 -screen 680x480 -origin 1360,0 -screen 680x480 &'
alias xem="export DISPLAY=:0 && Xephyr +xinerama -screen 700x400 -screen 600x300 -ac :1 &"
alias xend="export DISPLAY=:0"
alias xdwmf="export DISPLAY=:1"
alias exerec="valgrind --tool=callgrind --collect-jumps=yes --dump-instr=yes --quiet $EXE"
alias exema="valgrind --tool=massif $EXE"
alias exehel="valgrind --tool=helgrind --history-level=full --log-file=helgrind_output.txt --num-callers=30 $EXE"
alias exerecoff="callgrind_control -i off"
alias exerecon="callgrind_control -i on"
alias exedrd="valgrind --tool=drd $EXE"
alias exepens="valgrind --tool=expensiveprime $EXE"
alias valcheck='valgrind -s --quiet --track-fds=yes --error-limit=no --vgdb=full --leak-check=full --show-leak-kinds=all --leak-resolution=high --track-origins=yes --verbose --log-file="valgrind.txt"'
alias valcheckf='valgrind -s --quiet --track-fds=yes --error-limit=no --show-leak-kinds=all --leak-resolution=high --track-origins=yes --verbose --log-file="valgrind.txt"'
alias windata="wmctrl -l | awk '{print $1}' | xargs -I{} sh -c 'echo \"Properties for window ID: {}\"; xprop -id {}; echo \"-------------------------------------\"'"
alias winshow='for win in $(wmctrl -l | awk "{print \$1}"); do echo "Window ID: $win"; xprop -id $win; done'
alias ducks="du -sckh * | sort -rn | head"
alias ducksa="du -cksh *"

alias tuxpaint="nohup tuxpaint --1920x1080 &"

alias camon="nohup guvcview & exit"
alias vscode="nohup code & exit"
alias c#="dotnet"
alias C#="dotnet"
#xdotool search --onlyvisible --class '' getwindowname %@ 2>/dev/null | while read -r line; do echo "Window: $line"; xprop -id "$(xdotool search --name "$line" | head -n 1)" | grep -i protocol; echo "------------------------"; done
alias fixpip="sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old"
PS1='[\u@\h \W]\$ '


alias comfydefault='OMP_NUM_THREADS=32 MKL_NUM_THREADS=32 OPENBLAS_NUM_THREADS=32 NUMEXPR_NUM_THREADS=32 comfyui --output-directory $HOME/AI/TMP-OUTPUT/ --use-pytorch-cross-attention'
alias comfyloop='nohup bash -c '\''while true; do
    OMP_NUM_THREADS=32 \
    MKL_NUM_THREADS=32 \
    OPENBLAS_NUM_THREADS=32 \
    NUMEXPR_NUM_THREADS=32 \
    comfyui \
        --output-directory $HOME/AI/TMP-OUTPUT/ \
        --use-pytorch-cross-attention

    echo "ComfyUI stopped. Restarting in 2 seconds..."
    sleep 2
done'\'' > ~/comfyui-loop.log 2>&1 &'
alias comfyloopm='while true; do comfydefault; echo "ComfyUI stopped. Restarting in 2 seconds..."; sleep 2; done'




mkcd() {
    command mkdir -p -- "$1" && cd -- "$1"
}



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
# Created by `pipx` on 2023-12-03 21:46:36
export PATH="$PATH:$HOME/.local/bin"
alias nomachine=/usr/NX/bin/nxplayer

