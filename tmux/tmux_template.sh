#!/bin/bash
SESSION_NAME="github_io_source"

# Check if the session exists
tmux has-session -t "$SESSION_NAME" 2> /dev/null

# If the session exists, attach to it and exit
if [ $? -eq 0 ]; then
  tmux attach-session -t "$SESSION_NAME"
  exit 0
fi

# Create the layout and cd to directories
tmux new-session -d -s "$SESSION_NAME" \; \
    rename-window code \; \
    split-window -h -t 0.0 \; \
    new-window -d -n command \; \

tmux attach -t "$SESSION_NAME" \; \
    send-keys -t 0.0 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 0.0 "vim src/_drafts" C-m \; \
    send-keys -t 0.1 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 1.0 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 1.0 "shell/serve.sh" C-m \; \
    detach \; \

tmux attach -t "$SESSION_NAME" \; \
    select-pane -t 0.0 \; \
