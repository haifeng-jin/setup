#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Check if Miniconda is already installed to ensure idempotency.
if [ -d "$HOME/miniconda3" ]; then
    echo "Miniconda already installed. Skipping."
    exit 0
fi

# Detect system architecture to download the correct installer.
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    CONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
elif [ "$ARCH" = "aarch64" ]; then
    CONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Download the Miniconda installer to a temporary location.
wget "$CONDA_URL" -O /tmp/conda.sh
chmod +x /tmp/conda.sh

# Run the installer in batch mode (-b) and specify the installation path (-p).
bash /tmp/conda.sh -b -p "$HOME/miniconda3"

# Clean up the temporary installer file.
rm /tmp/conda.sh

# Initialize conda for zsh and bash shells.
~/miniconda3/bin/conda init zsh
~/miniconda3/bin/conda init bash
