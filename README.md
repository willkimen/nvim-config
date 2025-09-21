# Instalação

## Clone o projeto antes de tudo

```sh
git clone git@github.com:willkimen/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Instalação do Neovim no host

### Instalando o neovim

> Esse link te leva para opção de Pre-built archives, que é a maneira que eu gosto.

Link: [neovim/INSTALL.md at master · neovim/neovim · GitHub](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&
sudo rm -rf /opt/nvim &&
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

> Remova o diretório relativo ao neovim antigo no diretório opt/

```python
micro ~/.bashrc
nano ~/.bashrc
```

```python
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

> Insira essa linha. Se você está atualizando para um nova versão, a linha
com versão antiga já existe, então substitua pela mais nova.

```python
source ~/.bashrc
```

### Instalando as dependências

```sh
apt install -y git make unzip gcc ripgrep fd-find xclip fonts-noto-color-emoji
```

Link: [Node.js — Download Node.js®](https://nodejs.org/en/download/package-manager)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash &&
\. "$HOME/.nvm/nvm.sh" &&
nvm install 22 &&
nvm -v &&
npm -v &&
node -v
```

(opcional) Instala globalmente o lint para markdown:

```sh
npm install -g markdownlint-cli
```

## Instalando em um container Docker

Na raiz do projeto execute esse comando, troque os nomes `nvi` e `nvc` se quiser.

```sh
docker build \
  --build-arg NVM_VERSION=0.40.3 \
  --build-arg NODE_VERSION=24 \
  -t nvi . && docker run -it --name nvc nvi
```

### Instalando uv

```sh
install_uv.sh && source $HOME/.local/bin/env
```

### Instalando go

```sh
install_go.sh && source /etc/bash.bashrc
```

## Observação

Em ~/.local/share/ existe um diretório chamado nvim/, você pode remover esse diretório
se tiver com problemas de erros que não desaparecem mesmo atualizando os plugins.
Quando você rodar Lazy update ou coisa do tipo, ele será criado novamente, mas
agora com uma instalação limpa dos plugins.
Eu tinha atualizado um plugin, eu acho que era o mason, e estava dando problema,
e a solucão era atualizar o nvim para versão 0.11, mas mesmo atualizando, gerava
outros erros. Eu apaguei esse diretorio, executei Lazy update, o que instalou
novamente os plugins, mas de forma limpa, e funcionou.
