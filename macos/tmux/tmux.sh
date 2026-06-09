#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v tmux &> /dev/null; then
    brew install tmux
fi

cp "$SCRIPT_DIR/../tmux/tmux.conf" ~/.tmux.conf

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

~/.tmux/plugins/tpm/bin/install_plugins
