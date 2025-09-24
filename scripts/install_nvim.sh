#!/bin/bash
set -e

# -----------------------------
# Função para exibir mensagem de uso incorreto
# -----------------------------
usage() {
    echo "Uso: $0 <nvm_version> <node_version> [linguagem]"
    echo "linguagem opcional: go | py"
    exit 1
}

# -----------------------------
# Verificação de variáveis obrigatórias
# -----------------------------
if [ -z "$NVM_VERSION" ] || [ -z "$NODE_VERSION" ]; then
    usage
fi

# -----------------------------
# Instalação de dependências básicas
# -----------------------------
apt install -y curl git make unzip gcc ripgrep fd-find xclip fonts-noto-color-emoji

# -----------------------------
# Instalação do NVM e Node.js
# -----------------------------
# Baixa e executa o instalador do NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash

# Carrega o NVM no shell atual
. "$HOME/.nvm/nvm.sh"

# Instala a versão do Node.js definida na variável
nvm install ${NODE_VERSION}

# -----------------------------
# Execução opcional para instalar ambiente para linguagem
# -----------------------------
if [ -n "$LANGUAGE" ]; then
    case "$LANGUAGE" in
        go)
            go.sh
            ;;
        py)
            python.sh
            ;;
        *)
            echo "linguagem desconhecida: $LANGUAGE"
            exit 1
            ;;
    esac
else
    echo "Nenhuma linguagem selecionado. Instalado apenas Neovim e Node/NVM."
fi

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
