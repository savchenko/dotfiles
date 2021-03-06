#!/bin/bash
#
# Coreutils tweaks ----------------------------------------------------------------------
#
alias less="less -FXc"                          # -f automatically exit if file fits in one screen
                                                # -x disables sending the termcap init/deinit strings to the term
                                                # -c full screen repaints to be painted from the top line down

alias ls="ls --color=auto"

alias ll="ls -FlAhp --group-directories-first"  # -F append indicator to entries
                                                # -l long listing format
                                                # -A don't show ./ and ../
                                                # -h human-readable sizes
                                                # -p append / indicator to directories

alias lh="ls -Flhp"                             # same, but skip dots / hidden

alias lt="ls -lth"                              # newest first
alias lth="ls --color=always -lth 2> /dev/null | head"

alias cp="cp -iv"                               # prompt before overwrite, be verbose

alias mkdir="mkdir -pv"                         # -p create intermediate directories as required

alias mv="mv -iv"                               # -i ask before overwriting a file

alias grep="grep --color=auto"                  # colorize grep
alias egrep="grep -P"                           # use perl regexp by default
alias igrep="grep -i"

alias less="less -i"                            # smartcase=1
alias jobs="jobs -l"                            # show pid
alias which="command -v"

#
# Functions -----------------------------------------------------------------------------
#

# Grep for a process without showing `grep` command itself
psgrep() { ps -e --format "pid,uname,args" | grep -v "      grep " | grep "$@" -i --color=auto; }

# Open IPv4 ports
openports() { sudo lsof -Pni4 | awk '{print $1,$3,$8,$9}' | column -t; }

# Make directory and cd into it
mcd() { mkdir "$1" && cd "$1" || exit; }

# Find files not owned by user in pwd
notusr() { find . \! -user "$@" -print; }

# Create tmux-split and close it after $editor is terminated
if { [ -n "$TMUX" ]; }; then peek() { tmux split-window -p 40 "nvim" "$@" || exit; }; fi

# Compress file or directory
rmx() { if [ $# -eq 1 ]; then rar a -ol -m5 -ma5 -md1g "${1%/}.rar" "${1%/}"; fi }
tmx() { if [ $# -eq 1 ]; then tar cv "${1%/}" | xz -9 > "${1%/}.tar.xz" ; fi }
zmx() { if [ $# -eq 1 ]; then zip -r -9 "${1%/}".zip "${1%/}"; fi }

# Whois abuse contact
wabuse() { if [ $# -eq 1 ]; then whois ${1%} | grep -i abuse; fi }

# Host SSH keys
hostkeys() { for i in /etc/ssh/*key*; do ssh-keygen -l -f $i 2> /dev/null; done | sort -u; }

# Lazy git
lzg() { git add . && git commit -a -m "$@" && git push; }

# apt search | grep wrapper
aptgrep() { if [ $# -eq 2 ]; then apt search ${1%} 2> /dev/null | grep ${2%}; else echo "aptgrep SEARCH GREP"; fi }

# Time marker
marker() { printf "$(tput setaf 6)%$(( ${COLUMNS} - 12 ))s???(${bright_yellow}%(%H:%M:%S)T${cyan})???${clr_reset}" | sed 's/ /???/g'; }

# Systemd
slog() { sudo grc journalctl --unit "$1"; }
sstat() { sudo systemctl status "$1"; }

# Last N modified files
flast() { if [ $# -eq 1 ] && [ $1 -eq $1 ]; then find . -xdev -type f -not -path "*/.git/*" -printf "%T@ %Tc %p\n" | sort -n -r 2> /dev/null | head -${1%} | cut -d" " -f2-; fi }

# Single-pass empty directories removal
emptydirs() {
  local folders_empty=$(find . -type d -empty -print | sort --dictionary-order)
  local folders_count=$(echo -e "$folders_empty" | wc -l)
  if [ $folders_count -gt 1 ]; then
    echo -e "\n$folders_empty"
    if [[ $1 == '--force' ]]; then
      echo -e "\nRemoving $folders_count of empty folders\n"
      for dir in $folders_empty; do
        rmdir $dir
      done
      return
    else
      echo "" && read -p "Delete $folders_count empty folders (y/n)? " choice
      case "$choice" in
        y|Y )
          for dir in $folders_empty; do
            rmdir $dir
          done ;;
        * )   :;;
      esac
    fi
  else
    return 1
  fi
}

ipcalc() {
  sipcalc -i "$@" | grep --colour=never -E \
    "^Broadcast|^Addresses|^Network\ mask\s\s|^Usable\ range"
}

wtf() {
  host  "$1"
  whois "$1" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//' | grep -i "NetName\|Inetnum\|NetRange\|Creation\|Expiry"
}

chp() { # chrome-pause
  pkill -STOP -f "^chrome-sandbox$"
  pkill -STOP -f "^chromium$"
  pkill -STOP -f "^chrome$"
}

chr() { # chrome-resume
  pkill -CONT -f "^chrome$"
  pkill -CONT -f "^chromium$"
  pkill -CONT -f "^chrome-sandbox$"
}

ffp() { # firefox-pause
  pkill -STOP -f "(^|/)+iceweasel( |$)+"
  pkill -STOP -f "(^|/)+firefox(-bin)*( |$)+"
  pkill -STOP -f "(^|/)+firefox-esr( |$)+"
  pkill -STOP -f "x-www-browser"
  pkill -STOP -f "(^|/)+plugin-container( |$)+"
}

ffr() { # firefox-resume
  pkill -CONT -f "(^|/)+iceweasel( |$)+"
  pkill -CONT -f "(^|/)+firefox(-bin)*( |$)+"
  pkill -CONT -f "(^|/)+firefox-esr( |$)+"
  pkill -CONT -f "x-www-browser"
  pkill -CONT -f "(^|/)+plugin-container( |$)+"
}

# imv-wayland and XnView with monitor-mode supression
im() {
  if [ $# -eq 1 ]; then
    ( set +m && imv-wayland "${1%}" &> /dev/null & )
  else
    ( set +m && imv-wayland . &> /dev/null & )
  fi
  set -m
}
xn() {
  if [ $# -eq 1 ]; then
    ( set +m && xnview "${1%}" &> /dev/null & )
  else
    ( set +m && xnview . &> /dev/null & )
  fi
  set -m
}

# vifm wrapper to exit into an active directory
vicd() {
  local dst="$(command vifm --choose-dir -)"
  if [ -z "$dst" ]; then
    echo 'Cancelled'
    return 1
  fi
  cd "$dst"
}

# Quick thesaurus
function _dict_lookup {
  if [ -f $HOME/.local/share/wordlist ]; then
    # From WordNet's .sense:
    #   :%s/\v(^\w.*)\%.*/\1/g
    #   :%sort u
    _dict_file="$HOME/.local/share/wordlist"
  else
    _dict_file="/usr/share/dict/words"
  fi
  cat $_dict_file | fzf --preview 'wn {} -over | fold -w $COLUMNS -s' --preview-window=up:60%
}
function d {
  if [ $# -eq 0 ]; then
    wn `_dict_lookup` -over | fold -w $COLUMNS -s
  else
    wn $1 -over | fold -w $COLUMNS -s
  fi
}

footest(){
    local E D H M
    E="3003658200";
    D=$(($(($(( $E - $(date +%s))) * 1 ))/86400));
    H=$(date -u --date @$(($E - `date +%s`)) +%H);
    M=$(date -u --date @$(($E - `date +%s`)) +%M);
    let "H=10#${H}"; let "M=10#${M}";
    echo -e "$D days, $H hours and $M minutes\r";
}

foo() {
  list=( "$@" )
  echo "${#list[@]}"        # print array length
  echo "${list[@]}"         # print array elements
  for file in "${list[@]}"; do echo "${file:0:5}"; done  # loop over the array
}

xwl() { env -u WAYLAND_DISPLAY "$1"; } # launch in XWayland

# Multihighlighter, can be multipiped
function highlight() {
  declare -A fg_color_map
  fg_color_map[black]=30
  fg_color_map[red]=31
  fg_color_map[green]=32
  fg_color_map[yellow]=33
  fg_color_map[blue]=34
  fg_color_map[magenta]=35
  fg_color_map[cyan]=36
  fg_c=$(echo -e "\e[1;${fg_color_map[$1]}m")
  c_rs=$'\e[0m'
  sed -u s"/$2/$fg_c\0$c_rs/g"
}

# FZF ----------------------------------------------------------------------------------

FCLR="--color=dark,fg:#707880,bg:#000000,hl:#b5bd68,fg+:#c5c8c6,bg+:#000000,hl+:#d7ffaf,info:#707880,gutter:#000000,border:#373b41,prompt:#707880,pointer:#de935f,marker:#de935f,spinner:#8abeb7,header:#707880"
FZF_CTRL_F_OPTS="--preview-window='right:hidden' --margin=0,1,0,0 --preview 'bat --color=always 2> /dev/null --style=plain {} || tree -C {}' --inline-info --bind=ctrl-w:toggle-preview --bind=ctrl-x:toggle-sort --exact"


# CTRL+F or `fa` --find all
fzf-file-widget() {
  local selected="$(__fzf_select__)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

fa() { fzf-file-widget; }

# --- Bench ---
# find: ~2s real, 120% CPU on X13
# fd: ~0.53s real, 1000% CPU on X13. ~1.5s with -j 1
#
# find -L . -mindepth 1 \( -path '*timeshift/*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) -prune     -o -type f -print -o -type d -print -o -type l -print 2> /dev/null | cut -b3-
# fd -uu --exclude '/timeshift/*' --one-file-system -t f -t d -t l &> /dev/null

__fzf_select__() {
  eval "$FZF_DEFAULT_COMMAND" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_F_OPTS $FCLR" $(__fzfcmd) -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

__fzfcmd() {
  echo "fzf"
}

bind -m emacs-standard '"\er": redraw-current-line'
bind -m emacs-standard -x '"\C-f": fzf-file-widget'
bind -m vi-command -x '"\C-f": fzf-file-widget'
bind -m vi-insert -x '"\C-f": fzf-file-widget'

# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --follow . "$1"
}

# Use fdfind to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d . "$1"
}

# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --exact --margin=0,1,0,0 --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig +short {}' ;;
    *)            fzf "$@" ;;
  esac
}

# fe - edit file, optional cd into $1
fe() {
  local IFS=$'\n'
  local cur_pwd=$PWD
  local dst_pwd="."
  local query=""
  if [[ -d $1 ]]
    then dst_pwd=$1
      if [[ "$#" -gt 1 ]]; then query="${@:2}"; fi
  else query="$@";
  fi
  if [[ -d $1 ]]; then cd $1; else query="$@"; fi
  local f_files=($(fzf --query=$query +m --reverse \
                --preview-window='right:nohidden' \
                --preview 'tree -C {} | bat --color=always --style=plain' \
                --inline-info --bind=ctrl-w:toggle-preview \
                --bind=ctrl-x:toggle-sort --exact $FCLR))
  [[ -n "$f_files" ]] && ${EDITOR:-nvim} "${f_files[@]}"
  cd $cur_pwd
}

# fcd - universal `cd`, works for files and folders
fcd() {
  local f_dir
  local cur_pwd=$PWD
  local dst_pwd="."
  local query=""
  if [[ -d $1 ]]
    then dst_pwd=$1
      if [[ "$#" -gt 1 ]]; then query="${@:2}"; fi
  else query="$@";
  fi
  f_dir=$(fd --no-ignore --hidden --follow --one-file-system --full-path $dst_pwd | fzf +m -q "$query" --exact $FCLR);
  if [ -d "$f_dir" ]; then cd "$f_dir"; else cd $(dirname "$f_dir"); fi
  if [ $? -ne 0 ]; then cd $cur_pwd; fi
}

# fcp - cd into parent directory
fcp() {
  local dirs=()
  local parent_dir
  get_parent_dirs() {
    if [[ -d "$1" ]]; then dirs+=("$1"); else return; fi
    if [[ "$1" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo "$_dir"; done
    else
      get_parent_dirs "$(dirname "$1")"
    fi
  }
  parent_dir="$(
    get_parent_dirs "$(realpath "${1:-$PWD}")" \
      | fzf +m \
          --preview 'tree -C {} | head -n $FZF_PREVIEW_LINES' \
          --preview-window='right:hidden:wrap' \
          --bind=ctrl-w:toggle-preview \
          --bind=ctrl-x:toggle-sort \
  )" || return
  cd "$parent_dir" || return
}

# fkill - kill process
fkill() {
  local pid
  pid="$(
    ps -ef \
      | sed 1d \
      | fzf -e -m \
      | awk '{print $2}'
  )" || return
  kill -"${1:-9}" "$pid" &> /dev/null
}

# RipGrepAll-FZF
rgf() {
  RG_PREFIX="rga --files-with-matches"
  local file
  file="$(
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
      fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
        --phony -q "$1" \
        --bind "change:reload:$RG_PREFIX {q}" \
        --preview-window="70%:wrap"
  )" &&
  echo "opening $file" &&
  xdg-open "$file"
}

#
# Aliases -------------------------------------------------------------------------------
#

# System(ish)
alias ...="cd ../.."
alias ..="cd .."
alias :q="exit"
alias ap="ansible-playbook"
alias av="ansible-vault"
alias drag="dragon"
alias bfg="java -jar $HOME/.local/bin/bfg.jar"
alias c,="cd - > /dev/null"
alias c="clear"
alias ca="bat --style plain"
alias dd="sudo dd bs=4M status=progress oflag=sync"
alias dmesg="sudo dmesg -Hwx"
alias fd="fdfind --hidden --no-ignore --follow"
alias gpg="gpg2"
alias ip="ip --color=auto"
alias ipa="ip --color=auto -br addr"
alias psudo="sudo --preserve-env"
alias remount_nfs="sudo mount -a -t cifs"
alias rmadison="rmadison --architecture=source,amd64,all --suite=unstable,stable,testing,experimental,backports-new,stable-new,bullseye-backports,stable/non-free,testing/non-free,unstable/non-free,experimental/non-free,bullseye-backports/non-free,backports-new/non-free"
alias rm="rm -I --one-file-system"
alias rpath="realpath"
alias rt="reset"
alias s="sudo"
alias sc="systemctl"
alias symlinks="find . -maxdepth 1 -type l -ls | cut -c 75- | sort |
                ack --color-match='bold yellow' --passthru '\w+\Z' --color |
                ack --color-match='yellow' --passthru '^[a-zA-Z0-9\_\.\-]+' --color |
                ack --color-match='dark yellow' --passthru '\->\s'" # '"bad parser fix
alias atree="tree -pa"
alias xssh="env TERM=xterm-256color ssh"
alias sshkey="cat ~/.ssh/id_ecdsa_sk.pub | xc && echo 'Copied to clipboard.'"
alias sup='su --preserve-environment'
alias sv="sudoedit"
alias watch="watch -c"
alias xc="wl-copy --trim-newline"
alias newhostname='cat /usr/share/dict/words | iconv -t ASCII//TRANSLIT | grep -o -x "^[a-z]\{3,5\}[^s,d,y]$" | dd status=none conv=lcase | sort -R 2> /dev/null | uniq -u 2> /dev/null | head -10'

# NeoVim
alias e="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias gvi="nvim-gtk"

# Configs
alias vimrc="vim ~/.vimrc"
alias swayrc="vim ~/.config/sway/config"
alias aliasrc="vim ~/.config/aliases.sh"
alias gvars_pc="vim ~/Code/T3/t3_play/group_vars/pc.yml"
alias fontrc="vim ~/.config/fontconfig/fonts.conf"

# Git
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gca='git commit -a'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfig="git config --local -e"
alias gt='git -c color.status=always status --branch --short'
alias gu="gitui"
alias lg="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(green)(%ar)%C(reset) %C(white)%s%C(reset)%C(reset)%C(bold cyan)%d%C(reset)' --all"

# Grc
alias ping='grc ping -4'
alias traceroute='grc traceroute'

# Local
alias cal='ncal -3 -M -b'
alias fonts_list='fc-list | cut -d":" -f2 | sort | uniq'
alias fonts_rebuild='fc-cache -fv && mkfontdir ~/.local/share/fonts && xset +fp ~/.local/share/fonts'
alias gtk3themes="find /usr/share/themes/ -name gtk-3.0 | cut -d'/' -f5"
alias gtk3icons="
find /usr/share/icons/ ~/.local/share/icons -maxdepth 1 -mindepth 1 -type d -printf '%f\n' 2> /dev/null
"
alias gtk3cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name "cursors" 2> /dev/null"
alias mount_gocrypt=". <(gpg2 -dq $HOME/.local/bin/mount_gocrypt.sh.asc)"
alias mp3guess="mp3guessenc -v -r -f -i -s"
alias randomword="perl -e 'open IN, \"</usr/share/dict/words\";rand($.) < 1 && (\$n=\$_) while <IN>;print \$n'"
alias t='task'
alias weather="curl -s v2.wttr.in/Adelaide | head -42"
alias issues_dmesg="sudo dmesg -Hx --level=err,warn,crit,alert --color=always"
alias issues_suspend="sudo journalctl -u systemd-suspend.service"
alias issues_systemd="sudo systemctl --failed"
alias issues_topology="lstopo-no-graphics"
alias debug_keycodes="sudo libinput debug-events --show-keycodes"
alias issues_inxi="inxi -Fxxxz -G --display"
alias img2sixel="img2sixel -I"
alias vf="vicd"
alias cmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus)"'
alias timezones='undertime'
alias mydnsip="dig +cdflag +dnssec +short myip.opendns.com @resolver1.opendns.com"
alias myip="curl -s https://www.zx2c4.com/ip | cut -b1-15 | head -n1 | grep -o -P '^\d+\.\d+\.\d+\.\d+' | xargs"
alias ncmpcpp="ncmpcpp --quiet"
alias cpu_gcc='gcc -v -E -x c /dev/null -o /dev/null -march=native 2>&1 | grep /cc1'
alias serve='twistd3 --no_save --nodaemon web --path=.'
alias oneline_files='find . -type f -print0 | xargs -0 stat --printf "%n %a\n"'
alias oneline_dirs='find . -type d -print0 | xargs -0 stat --printf "%n %a\n"'
alias codelog='git log --date=short --pretty=format:"%ad $i %s" --author="$(git config --get user.email)"'
alias fbt='foot -c ~/.config/foot/foot_bitmap.ini &'
alias xwl='env -u WAYLAND_DISPLAY'
alias pkg_foreign='aptitude search "?installed?not(?narrow(?installed,?origin(^Debian$)?archive(^stable$)))" --group-by=none -F "%p %v %t %M" | grep -v -E "(stable-security|stable-updates)" | column -t | sort -k3,3 | sed "s/A$/Auto/"'
alias pkg_backports_available='apt -t bullseye-backports -s upgrade 2> /dev/null | grep -E ^Inst | grep -E "\[.+\]\s\(" | cut -d " " -f 2-4 | sed s/[]\)\([]//g | column -t'
alias pkg_backports_staging_available='apt -t bullseye-backports-staging -s upgrade 2> /dev/null | grep -E ^Inst | grep -E "\[.+\]\s\(" | cut -d " " -f 2-4 | sed s/[]\)\([]//g | column -t'
alias newsway='bash /home/lbr/shares/lbr_code/sway/16_hardened/run.sh'
alias calc='qalc'
alias calibre='calibre --no-update-check --detach'
alias yt-dlp='yt-dlp --restrict-filenames --trim-filenames 20'
alias yt-smallvid-bestaud="yt-dlp -f 'ba+res/b'"
alias signify='signify-openbsd'
alias iostatwatch='sudo S_COLORS=always watch -c iostat -h'

# Gammaster
alias night='gammastep -l -34.92866:138.59863 -b 1:0.75 -r -P -v'
alias day='gammastep -x -P -r -v'

alias dot_dig="kdig -d @185.228.168.168 +tls-ca +tls-host=family-filter-dns.cleanbrowsing.org"

# Wired & Wireless
alias wifimon='wavemon -g'
alias wifilow='sudo iwconfig wlan0 txpower 18'
alias wifihigh='sudo iwconfig wlan0 txpower 20'
alias fixeth='echo on | sudo tee /sys/bus/pci/devices/0000\:00\:16.0/power/control'
alias wifion='iwctl adapter phy0 set-property Powered on && iwctl device wlan0 set-property Powered on && sudo iwconfig wlan0 txpower 18'
alias wifioff='iwctl adapter phy0 set-property Powered off && iwctl device wlan0 set-property Powered off'
wifistatus() {
  local device=$(iwctl device wlan0 show | grep Powered | cut -d" " -f 20-25 | xargs)
  local adapter=$(iwctl adapter phy0 show | grep Powered | cut -d" " -f 20-25 | xargs)
  echo -e "Device: $device\nAdapter: $adapter"
}

# Images
pngdown() { pngquant --speed 1 --strip --force "$1"; }

imresize() {
  if [ $# -ne 2 ]; then
    echo -e "\nUsage:\n\tgm_resize myImage.foo 100\n\n\
      Will resize myImage.foo to 100px on the long side.
      Result will be saved as myImage_100px.foo\n"
    return 1;
  elif [[ ! $2 =~ ^-?[0-9]+$ ]]; then
    echo -e "Second parameter must be an integer";
    return 2;
  elif [ "$2" -gt 65535 ] || [ "$2" -lt 1 ]; then
    echo -e "Size must be within 1..65535 range";
    return 1;
  else
    local fname fext
    fname=$(echo "$1" | rev | cut -d"." -f2- | rev);
    fext=$(echo "$1" | rev | cut -d"." -f1 | rev);
    fext_allowed=("png" "jpg" "jpeg" "webp" "tif" "tiff");
    for ext in "${fext_allowed[@]}"; do
      if [ "$ext" = "$fext" ]; then
        out=$(gm convert -verbose "$1" -resize "$2"x"$2"^ "$fname"_"$2"px."$ext" 2>&1 );
        fsize_in=$(echo -e "$out" | head -1 | cut -d" " -f6);
        fsize_out=$(echo -e "$out" | tail -1 | cut -d" " -f6);
      fi
    done
    if [ -z "$out" ]; then
      echo -e "Unable to convert an extension of .$fext";
      return 1;
    else
      echo "OK: $fsize_in --> $fsize_out";
    fi
  fi
}

# WebP tiff archival
arc_tiff() {
  if [ $# -lt 1 ]; then
    echo -e "Usage:\n\tarc_tiff *.tiff\nor\n\tarc_tiff foo.tiff"
  elif [ $# -eq 1 ]; then
    if [ ! -r webP_"$1" ]; then
      if [[ ${1:0:5} != "webP_" ]]; then
        gm convert -verbose -compress webp -define \
          'tiff:webp-lossless=TRUE webp:lossless=true' \
          -quality 100 "$1" webP_"$1"
      else
        echo -e "Refusing to re-compress $1"
      fi
    else
      echo -e "webP_$1 already exists, refusing to overwrite"
    fi
  elif [ $# -gt 1 ]; then
    files=( "$@" )
    echo -e "\nWorking on ${#files[@]} files...\n"
    for file in "${files[@]}"; do
      if [ -r webP_"$file" ]; then
        echo -e "webP_$file already exists, refusing to overwrite";
      elif [[ ${file:0:5} != "webP_" ]]; then
        gm convert -verbose -compress webp -define \
          'tiff:webp-lossless=TRUE webp:lossless=true' \
          -quality 100 "$file" webP_"$file"
      else
        echo -e "Refusing to re-compress $file"
      fi
    done
  fi
}
