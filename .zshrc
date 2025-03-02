# ~/.zshrc

# environment variables

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export PATH=$PATH:"$XDG_CONFIG_HOME"/cargo/bin

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

export EDITOR=nvim
export VISUAL=$EDITOR

# configuration
zstyle ':completion:*' menu select
setopt autocd

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# history
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt appendhistory
setopt SHARE_HISTORY

# prompt
PS1=$'%B%F{magenta}%n%f at %F{blue}%m%f in %F{cyan}[%~]%f\n>%b '
PS2='%B>%b '

# keybinds
bindkey -e

# aliases
alias ll='ls -lAh --color=auto'
