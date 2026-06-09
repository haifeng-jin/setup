#!/bin/bash
set -euo pipefail

if [ -d "$HOME/miniconda3" ]; then
    echo "Miniconda already installed. Skipping."
    exit 0
fi

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    CONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
elif [ "$ARCH" = "arm64" ]; then
    CONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

curl -fsSL "$CONDA_URL" -o /tmp/conda.sh
chmod +x /tmp/conda.sh
bash /tmp/conda.sh -b -p "$HOME/miniconda3"
rm /tmp/conda.sh

~/miniconda3/bin/conda init zsh
