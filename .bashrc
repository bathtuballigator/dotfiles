#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias syn="onedrive --synchronize"
PS1='[\u@\h \W]\$ '

export EDITOR='nano'
export VISUAL='nano'
export env QT_QPA_PLATFORM=xcb
export XDG_CONFIG_HOME="$HOME/.config"
eval "$(zoxide init bash --cmd cd)"

eval "$(fzf --bash)"
