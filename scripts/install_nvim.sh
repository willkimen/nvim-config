#!/bin/bash
set -e

# -----------------------------
# Function to show usage error
# -----------------------------
usage() {
    echo "Usage: $0 <nvm_version> <node_version>"
    exit 1
}

# -----------------------------
# Check arguments
# -----------------------------
NVM_VERSION=$1
NODE_VERSION=$2

if [ -z "$NVM_VERSION" ] || [ -z "$NODE_VERSION" ]; then
    usage
fi

# -----------------------------
# Install basic dependencies
# -----------------------------
apt update && apt install -y curl git make unzip gcc ripgrep fd-find xclip fonts-noto-color-emoji

# -----------------------------
# Install Neovim
# -----------------------------
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove any previous Neovim installation in /opt/nvim
rm -rf /opt/nvim

# Extract the Neovim tar.gz to /opt
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Rename the extracted folder to /opt/nvim for easier future references
mv /opt/nvim-linux-x86_64 /opt/nvim

# Create a symbolic link of the Neovim binary in /usr/local/bin
# This allows running 'nvim' from anywhere since /usr/local/bin is in PATH
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# Remove the downloaded tar.gz, no longer needed
rm -f nvim-linux-x86_64.tar.gz

# Create the directory for Neovim configuration
mkdir -p ~/.config/nvim

# -----------------------------
# Install NVM and Node.js
# -----------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash

# Load NVM into the current shell session
\. "$HOME/.nvm/nvm.sh"

# Install Node.js
nvm install ${NODE_VERSION}

# Install markdown linter globally
npm install -g markdownlint-cli
