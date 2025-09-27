#!/bin/bash

set -e

mkdir golab
cd golab
go mod init golab
mkdir -p cmd/golab internal configs builds
touch cmd/golab/main.go
