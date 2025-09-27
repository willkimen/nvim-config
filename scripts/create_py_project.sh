#!/bin/bash

set -e

uv init pylab
cd pylab
uv add pyright --dev

pyright_config='

[tool.pyright]
venvPath="."
venv=".venv"
'
echo "$pyright_config" >> pyproject.toml
