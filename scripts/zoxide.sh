#!/usr/bin/env bash

zoxide query -l --score \
  | awk '{print substr($0, 1, 6) "\t" substr($0, 8)}' \
  | fzf \
    --exact \
    --no-sort \
    --delimiter $'\t' \
    --nth 2 \
    --cycle \
    --keep-right \
    --border sharp \
    --info inline \
    --popup \
    --layout reverse \
    --tabstop 1 \
    --exit-0 \
    --preview '\command -p ls -Cp --color=always --group-directories-first {2..}' \
    --preview-window 'down,30%,sharp' \
    --bind 'ctrl-z:ignore,btab:up,tab:down' \
    --bind 'enter:become(tmux split-window -v -c {2..})' \
    --bind 'ctrl-x:become(tmux split-window -v -c {2..})' \
    --bind 'ctrl-v:become(tmux split-window -h -c {2..})' \
    --bind 'ctrl-t:become(tmux new-window -c {2..})'

exit 0
