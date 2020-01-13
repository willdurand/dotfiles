#!/usr/bin/env bash

percentage=66
size=$(expr $(tmux display -p '#{window_width}') \* $percentage / 100)

tmux set-window-option main-pane-width "$size"
tmux select-layout main-vertical
tmux display 'layout updated!'

exit 0
