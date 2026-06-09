#!/bin/bash
set -euo pipefail

mkdir -p ~/.local/bin

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/7.4.1/bazel-7.4.1-darwin-x86_64"
elif [ "$ARCH" = "arm64" ]; then
    BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/7.4.1/bazel-7.4.1-darwin-arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo "Downloading Bazel 7.4.1..."
curl -L "$BAZEL_URL" -o ~/.local/bin/bazel
chmod +x ~/.local/bin/bazel

echo "Bazel 7.4.1 installed to ~/.local/bin/bazel"
echo "Please ensure ~/.local/bin is in your PATH."
