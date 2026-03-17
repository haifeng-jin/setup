#!/bin/bash
set -e

# Create ~/.local/bin if it doesn't exist
mkdir -p ~/.local/bin

# Download Bazel 7.4.1
echo "Downloading Bazel 7.4.1..."
curl -L https://github.com/bazelbuild/bazel/releases/download/7.4.1/bazel-7.4.1-linux-x86_64 -o ~/.local/bin/bazel

# Make it executable
chmod +x ~/.local/bin/bazel

echo "Bazel 7.4.1 installed to ~/.local/bin/bazel"
echo "Please ensure ~/.local/bin is in your PATH."
