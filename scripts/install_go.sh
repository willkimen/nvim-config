#!/bin/bash
set -e

# Default Go version
DEFAULT_GO_VERSION="1.25.1"

# Usage function
usage() {
    echo "Usage: $0 [go_version]"
    echo "Example: $0 1.25.1"
    echo "If no version is provided, default is ${DEFAULT_GO_VERSION}"
    exit 1
}

# Check arguments or fallback to default
GO_VERSION=${1:-$DEFAULT_GO_VERSION}

GO_TARBALL="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TARBALL}"

# Download Go tarball
curl -LO "${GO_URL}"

# Extract Go into /usr/local
tar -C /usr/local -xzf "${GO_TARBALL}"

# Clean up tarball
rm -f "${GO_TARBALL}"

# Add Go to global PATH in /etc/bash.bashrc if not already present
if ! grep -q "/usr/local/go/bin" /etc/bash.bashrc; then
    echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/bash.bashrc
fi

#============ Atenção ============
# Depois de rodar o script install_go.sh, execute: source /etc/bash.bashrc...
# ...para add de fato os binários ao path.
# install_go.sh && source /etc/bash.bashrc
