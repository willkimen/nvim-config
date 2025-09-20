#!/bin/bash
set -e

curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv local bin to PATH
source $HOME/.local/bin/env

uv python install # Instala a última versão do python

#============ Atenção ============
# Depois de rodar o script install_uv.sh, execute: source $HOME/.local/bin/env.
# install_uv.sh && source $HOME/.local/bin/env
