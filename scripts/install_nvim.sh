#!/bin/bash
set -e

# -----------------------------
# Instalação de dependências básicas
# -----------------------------
apt install -y curl git make unzip gcc ripgrep fd-find xclip fonts-noto-color-emoji

# -----------------------------
# Instalação do Neovim
# -----------------------------
# Baixa o tar.gz da versão mais recente do Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove instalação antiga (caso exista) em /opt/nvim
rm -rf /opt/nvim

# Extrai o Neovim para /opt
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Renomeia a pasta extraída para /opt/nvim (mais simples de referenciar depois)
mv /opt/nvim-linux-x86_64 /opt/nvim

# Cria um link simbólico em /usr/local/bin para executar "nvim" de qualquer lugar
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# Remove o arquivo tar.gz que não é mais necessário
rm -f nvim-linux-x86_64.tar.gz

# Garante que a pasta de configuração do Neovim exista
mkdir -p ~/.config/nvim
