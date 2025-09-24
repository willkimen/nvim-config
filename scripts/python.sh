#!/bin/bash
set -e

# -----------------------------
# Instala o UV (uma ferramenta de versionamento de runtimes)
# -----------------------------
curl -LsSf https://astral.sh/uv/install.sh | sh

# -----------------------------
# Adiciona o binário local do UV ao PATH para o shell atual
# -----------------------------
source $HOME/.local/bin/env

# -----------------------------
# Instala a última versão do Python usando o UV
# -----------------------------
uv python install

