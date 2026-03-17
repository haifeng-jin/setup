#!/bin/bash
set -e

echo "Enabling Debian non-free repositories..."
sudo sed -i 's/Components: main/Components: main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources

echo "Updating APT packages..."
sudo apt-get update

echo "Installing generic Linux headers, NVIDIA drivers, and firmware..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y linux-headers-amd64 nvidia-driver firmware-misc-nonfree

echo "Installing specific Linux headers for the running kernel..."
sudo apt-get install -y linux-headers-$(uname -r)

echo "Rebuilding NVIDIA DKMS module..."
sudo dpkg-reconfigure nvidia-kernel-dkms || true

echo "Loading NVIDIA kernel module..."
sudo modprobe nvidia

echo "Verifying NVIDIA GPU..."
nvidia-smi

echo "Installing PyTorch with CUDA support via pip..."
pip install torch torchvision torchaudio

echo "CUDA and PyTorch installation complete!"
