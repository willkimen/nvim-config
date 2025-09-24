FROM ubuntu

# -----------------------------
# Definição de argumentos de build que podem ser sobrescritos
# -----------------------------
ARG NVM_VERSION=0.40.3
ARG NODE_VERSION=22
ARG LANGUAGE=""  # opcional

# Transformando os argumentos em variáveis de ambiente
ENV NVM_VERSION=${NVM_VERSION}
ENV NODE_VERSION=${NODE_VERSION}
ENV LANGUAGE=${LANGUAGE}

# -----------------------------
# Copiando todos os scripts para dentro do container
# -----------------------------
# Eles ficarão em /usr/local/bin/, que já está no PATH
COPY scripts/ /usr/local/bin/

# -----------------------------
# Copiando a configuração do Neovim
# -----------------------------
# Observação: não use "~" no Dockerfile para home, use /root
COPY init.lua /root/.config/nvim/
COPY lua/ /root/.config/nvim/lua/

# -----------------------------
# Instalação do Neovim, NVM e Node.js
# -----------------------------
# - Dá permissão de execução a todos os scripts copiados
# - Executa o script principal de instalação (install_nvim.sh)
# - Remove o install_nvim.sh depois da instalação (para não ficar "sobrando")

RUN apt update && \
    chmod -R +x /usr/local/bin/ && \
    /usr/local/bin/install_nvim.sh && \
    rm -f /usr/local/bin/install_nvim.sh
