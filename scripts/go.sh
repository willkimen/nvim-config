#!/bin/bash
set -e

# -----------------------------
# Versão padrão do Go caso não seja informada
# -----------------------------
DEFAULT_GO_VERSION="1.25.1"

# -----------------------------
# Função para exibir uso correto do script
# -----------------------------
usage() {
    echo "Uso: $0 [go_version]"
    echo "Exemplo: $0 1.25.1"
    echo "Se nenhuma versão for fornecida, o padrão é ${DEFAULT_GO_VERSION}"
    exit 1
}

# -----------------------------
# Verifica argumento ou usa versão padrão
# -----------------------------
GO_VERSION=${1:-$DEFAULT_GO_VERSION}

GO_TARBALL="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TARBALL}"

# -----------------------------
# Baixa o tarball do Go
# -----------------------------
curl -LO "${GO_URL}"

# -----------------------------
# Extrai o Go em /usr/local
# -----------------------------
tar -C /usr/local -xzf "${GO_TARBALL}"

# -----------------------------
# Remove o tarball baixado para limpeza
# -----------------------------
rm -f "${GO_TARBALL}"

# -----------------------------
# Adiciona o Go ao PATH global, se ainda não estiver
# -----------------------------
if ! grep -q "/usr/local/go/bin" /etc/bash.bashrc; then
    echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/bash.bashrc
fi
