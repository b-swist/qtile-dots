# ~/.zshrc

# environment variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

export EDITOR=nvim
export VISUAL=$EDITOR

export PATH=$PATH:"$XDG_CONFIG_HOME"/cargo/bin

# completions
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots)

setopt correct
setopt auto_menu
setopt auto_cd
setopt mark_dirs

zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true

# history
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_all_dups
setopt append_history
setopt share_history

# prompt
autoload -U colors
colors

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats 'on %F{215}(󰘬 %b)%f'
setopt prompt_subst

PS1=$'%B%F{magenta}%n%f at %F{blue}%m%f in %F{cyan}[%~]%f ${vcs_info_msg_0_}\n>%b '
PS2='%B>%b '
RPROMPT='%B%D{%d %h, %R}%b'

# keybinds
bindkey -e

# aliases
alias ll='ls -lAh --color=auto --group-directories-first'

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
