#!/bin/bash

set -e

# Verifica se foi passado um argumento
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

uv init "$PROJECT_NAME"
cd "$PROJECT_NAME"
uv add pyright --dev

pyright_config='

[tool.pyright]
venvPath="."
venv=".venv"
'
echo "$pyright_config" >> pyproject.toml

