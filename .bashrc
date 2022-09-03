#

#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# PS1='[🐧@🏠] - \w\$ '


# pnpm package manager
export PNPM_HOME="/home/mathias/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# set custom prompt for sudo
export SUDO_PROMPT="⚡password for mathias: "

# set default folder for screenshots
export GRIM_DEFAULT_DIR="/home/mathias/Pictures/screenshots"

# for java applications in wayland:
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=xcb # android-studio


# set default terminal
export TERMINAL="alacritty"

# set azerty layout
export XKB_DEFAULT_LAYOUT="be"

# default aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias v=nvim
