#
# hyperfine 'bash -i' && compare to 'bash --norc'
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Check if we are root by any chance --------------------------------------------
if [ "$(id -u)" = 0 ]; then _root=1; else _root=0; fi

# Check if we're running in GUI mode
_GUI=0; [ "$DISPLAY" ] || [ "$WAYLAND_DISPLAY" ] && _GUI=1

# Check if this is a remote session ---------------------------------------------
_remote=0; if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  _remote=1
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) _remote=1;;
  esac
fi

# Use bash-completion if available. This sources git-prompt as well.
bash_completion_path="/usr/share/bash-completion/bash_completion"
[[ $PS1 && -r $bash_completion_path ]] && source $bash_completion_path

#
# PS inputs ---------------------------------------------------------------------
#
red='\[\e[38;5;1m\]'
green='\[\e[38;5;2m\]'
blue='\[\e[38;5;4m\]'
grey='\[\e[38;5;245m\]'
light_grey='\[\e[38;5;249m\]'
clr_reset='\[$(tput sgr0)\]\[\e[0m\]'

if [ $_root -eq 1 ]; then user_color="${red}[!]"; else user_color="${light_grey}"; fi

PS1="${user_color}"                                      # user
if [ $_remote -eq 1 ]; then PS1+=" ${blue}\h"; fi        # hostname, show only for remotes
if [[ $inside_vifm -eq 1 ]]; then PS1+=" ${green}FM"; fi # vifm tag
PS1+=" ${grey}\w"                                        # work dir
if [ -n "$__git_printf_supports_v" ]; then PS1+="${light_grey}\$(__git_ps1)"; fi
PS1+="\n ${clr_reset}"                                   # input symbol

export PS1
export PS2="\[\e[38;5;3m\] |${clr_reset} "

#
# PS1  ------------------------------------------------------------------------
#
set -o vi                                           # Enable Vi-mode

_urlencode() {                                      # OSC 7 helpers, use <C-S-n>
  local length="${#1}"                              # to spawn a new shell in $PWD
  for (( i = 0; i < length; i++ )); do
    local c="${1:$i:1}"
    case $c in
      %) printf '%%%02X' "'$c" ;;
      *) printf "%s" "$c" ;;
    esac
  done
}
osc7_cwd() {
  printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$(_urlencode "$PWD")"
}

fhstr() {                                           # Hacking on HSTR
  _PSTMP=$PS1; PS1='';
  _LNTMP=$READLINE_LINE;
  _PTTMP=$READLINE_POINT;
  _MKTMP=$READLINE_MARK;
  READLINE_LINE='';
  READLINE_POINT=0;
  READLINE_MARK=0;
  hhstr $_LNTMP;
  PS1=$_PSTMP;
  #
  # TODO: Make this conditional, based on the return code
  #
  # READLINE_LINE=$_LNTMP;
  # READLINE_POINT=$_PTTMP;
  # READLINE_MARK=$_MKTMP;
}
bind -x '"\C-r":"fhstr"'

bind -x '"\C-l"':"reset && exec bash"               # <C-l> resets the terminal

for N in {0..9};                                    # Don't use esoteric argument features of the Readline
  do
bind -m vi "$N":
 done

complete -d cd                                      # cd only into directory

shopt -s nocaseglob                                 # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend                                 # Append to the Bash history file rather than overwriting
shopt -s cdspell                                    # Autocorrect typos in path names when using `cd`
shopt -s checkwinsize                               # Should help with overlapping lines
shopt -s no_empty_cmd_completion                    # No empty command completion.
shopt -s histverify histreedit                      # Check expansions before submitting command
shopt -s autocd                                     # cd if command is a valid path
shopt -s checkwinsize                               # check window size and update $LINES and $COLUMNS

export HISTCONTROL=ignoreboth:erasedups             # Don't store duplicated entries, hide leading space
export HISTFILESIZE=10000                           # Increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}                     # Increase history size (default is 500)
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:c"     # Don't store these commands
export PROMPT_COMMAND="history -a; history -n; osc7_cwd; ${PROMPT_COMMAND}"

# z `dirname` - telepathic cd with fzf support ----------------------------------
if [ -x /usr/local/bin/z.lua ] && [ -x /usr/bin/fzf ] \
  && [ -x /usr/local/bin/czmod.bash ] && [ -x /usr/local/bin/czmod ]; then
    eval "$(lua '/usr/local/bin/z.lua' --init bash enhanced once fzf)";
    source /usr/local/bin/czmod.bash;
fi

# Automatically initialise GPG-agent --------------------------------------------
# if [[ $_root -eq 0 ]] && [[ $_GUI ]]; then
#   if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#     SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#     export SSH_AUTH_SOCK
#   fi
#   echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null
# fi

# Source aliases  ---------------------------------------------------------------
if [ -r "$HOME/.config/aliases.sh" ]; then . "$HOME/.config/aliases.sh"; fi

# Source Cargo ------------------------------------------------------------------
if [ -r "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi

# Source trings -----------------------------------------------------------------
if [ -r "$HOME/.config/trocs.sh" ]; then . "$HOME/.config/trocs.sh"; fi

# Try to load fzf-completion, *has* to be at the end ----------------------------
if [ -r /usr/share/doc/fzf/examples/completion.bash ]; \
then . /usr/share/doc/fzf/examples/completion.bash; fi

# Fly Sway, fly! ----------------------------------------------------------------
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ $_root -eq 0 ]]; then
#   exec sway;
# fi
