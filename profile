# export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/dbus_session_bus"
# export LS_COLORS="so=3;38;2;252;172;227:di=0;38;2;110;162;219:ln=3;38;2;196;160;0:*~=0;38;2;191;191;191:no=0:bd=3;38;2;239;41;41:ow=0:pi=3;38;2;52;226;226:tw=0:fi=0:ex=0;38;2;90;179;7:or=3;38;2;204;0;0;48;2;51;0;0:mi=3;38;2;204;0;0;48;2;51;0;0:st=4:cd=3;38;2;239;41;41"
export ANSIBLE_NOCOWS=1
export AWT_TOOLKIT=MToolkit          # Optional, for Java GUIs
export BAT_THEME="Midnight.hybrid"
export CCACHE_DIR="$HOME/.cache/ccache"
export CLICOLOR=1
export CLUTTER_BACKEND=wayland
export CURL_HOME="$HOME/.config/curl"
export ECORE_EVAS_ENGINE=wayland_egl
export EDITOR="nvim"
export ELM_ACCEL=gl
export ELM_DISPLAY=wl
export ELM_ENGINE=wayland_egl
export FILEMANAGER="vifm"
export FZF_DEFAULT_COMMAND="fd -uu --one-file-system -t f -t d -t l"
export FZF_DEFAULT_OPTS="--height=99% --reverse --color=dark,fg:#707880,bg:#000000,hl:#b5bd68,fg+:#c5c8c6,bg+:#000000,hl+:#d7ffaf,info:#707880,gutter:#000000,border:#373b41,prompt:#707880,pointer:#de935f,marker:#de935f,spinner:#8abeb7,header:#707880"
export FZF_PREVIEW_COMMAND="bat --style=plain --color always {} || tree -C {}"
export GDK_BACKEND=wayland
export GDK_DPI_SCALE=1
export GDK_SCALE=1
export GIT_EDITOR="nvim -u $HOME/.config/nvim/init.vim"
export GNC_CONFIG_HOME="$HOME/.config/gnucash"
export GNC_DATA_HOME="$HOME/.local/share/gnucash"
export GPG_TTY=$(tty)                # https://dev.gnupg.org/T3412
export GREP_COLOR="32"
export HSTR_CONFIG=hicolor #,hide-help
export HSTR_PROMPT="> "
export LESSCHARSET=utf-8
export LESSCOLOR=yes
export LESSOPEN="|lesspipe.sh %s"
export LESSQUIET=1
export LESS_ADVANCED_PREPROCESSOR=1
export LIBVIRT_DEFAULT_URI="qemu:///system"
export MANPAGER="nvim -u $HOME/.config/nvim/init.vim -c 'set ft=man' -"
export MANPATH="$HOME/.local/man:$MANPATH"
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export MPD_HOST="$HOME/.mpd/socket"
export NO_AT_BRIDGE=1
export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_NO_WINDOW_DECORATION=1
export NVIM_GTK_PREFER_DARK_THEME=1
export NVIM_QT_RUNTIME_PATH="/usr/share/nvim-qt/runtime"
export PATH=$HOME/.local/bin:$HOME/code/portable/bin:$PATH
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"
export SDL_VIDEODRIVER=wayland
export STNOUPGRADE=1                 # Don't autoupgrade Syncthing
export TIMEFORMAT=$'real\t%3lR\nuser\t%3lU\nsys\t%3lS\nCPU\t%P%'
export TMPDIR="$HOME/.cache/TMPDIR"
export WGETRC="$HOME/.config/wgetrc"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP=sway
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"
export XDG_SESSION_TYPE=wayland
export XKB_DEFAULT_OPTIONS=caps:escape
export _JAVA_AWT_WM_NONREPARENTING=1 # Optional, for Java GUIs
export _ZL_ADD_ONCE=1                # Update Z db only on cd
export _ZL_DATA="$HOME/.cache/zlua"
export _ZL_HYPHEN=1                  # Treat hyphen as normal char
export _ZL_MATCH_MODE=1              # Use enhanced match mode
#
# Buildflags ------------------------------------------------------------------
# (see `dpkg-buildflags`)
# export CFLAGS="$CFLAGS -O2 -fstack-protector-all -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -Wno-ignored-optimization-argument -s"
# export CGO_CPPFLAGS="-g -O2 -fstack-protector-all -D_FORTIFY_SOURCE=2 -s"
# export CGO_ENABLED=1
# export GOFLAGS="-buildmode=pie -trimpath"
# export LDFLAGS="-pie -Wl,-z,now,-z,relro"
# export GOOS="linux"
# export RUSTFLAGS='-C link-arg=-s'
