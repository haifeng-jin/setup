#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# The name of the tmux session to create or attach to.
SESSION_NAME="github_io_source"

# Check if a tmux session with this name already exists.
if tmux has-session -t "$SESSION_NAME" 2> /dev/null; then
    # If the session exists, attach to it and exit the script.
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

# Create a new detached session with the specified name.
# Create an initial window named 'code', split it horizontally, 
# and create a second window named 'command'.
tmux new-session -d -s "$SESSION_NAME" \; \
    rename-window code \; \
    split-window -h -t 0.0 \; \
    new-window -d -n command

# Attach to the session and send initial commands to the panes.
# C-m simulates the Enter key.
tmux attach -t "$SESSION_NAME" \; \
    send-keys -t 0.0 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 0.0 "vim src/_drafts" C-m \; \
    send-keys -t 0.1 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 1.0 "cd ~/git/$SESSION_NAME" C-m \; \
    send-keys -t 1.0 "shell/serve.sh" C-m \; \
    detach

# Finally, attach and select the primary coding pane.
tmux attach -t "$SESSION_NAME" \; \
    select-pane -t 0.0
