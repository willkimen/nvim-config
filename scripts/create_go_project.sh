#!/bin/bash

set -e

# Verifica se foi passado um argumento
if [ -z "$1" ]; then
  echo "Uso: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"
go mod init "$PROJECT_NAME"
mkdir -p cmd/"$PROJECT_NAME" internal configs builds pkg scripts api
touch cmd/"$PROJECT_NAME"/main.go
