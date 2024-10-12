#!/bin/zsh

function start_tmux() {
    tmux new -s $1 -c $PWD -n editor -d
    tmux new-window -a -n "file manager" -t $1":editor" -c $PWD nvim
    tmux split-window -t $1":file manager" -v -c $PWD yazi
    tmux split-window -t $1":file manager" -h -c $PWD htop
    tmux new-window -a -n terminal -t $1":file manager" -c $PWD
    tmux send-keys -t editor "nvim" Enter
    tmux select-window -t $1":editor"
    tmux attach -t $1
}

if [[ $# -eq 0 ]] || [[ $# -gt 1 ]]; then
    name="main"
else
    name=$1
fi

tmux ls 2>/dev/null | rg $1 >/dev/null 2>/dev/null

if [[ $? -eq 0 ]]; then
    tmux attach -t $name
else
    start_tmux $name
fi


