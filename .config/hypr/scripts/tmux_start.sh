#!/bin/zsh

name=$1

function start_tmux() {
    tmux new -s $1 -c $PWD -n editor -d
    tmux new-window -a -n runner -t $1":editor" -c $PWD
    tmux new-window -a -n terminal -t $1":runner" -c $PWD
    tmux send-keys -t editor "nvim" Enter
    tmux select-window -t $1":editor"
    tmux attach -t $1
}

if [[ $# -eq 0 ]] || [[ $# -gt 1 ]]; then
    echo "please provide 1 and only 1 argument"
    exit
fi

tmux ls 2>/dev/null | rg $1 >/dev/null 2>/dev/null

if [[ $? -eq 0 ]]; then
    tmux attach -t $1
else
    start_tmux $1
fi


