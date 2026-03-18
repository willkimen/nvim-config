# Instalação

## Clone o projeto antes de tudo

```sh
git clone git@github.com:willkimen/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Instalação do Neovim no host

### Instalando o neovim

> Esse link te leva para opção de Pre-built archives, que é a maneira que eu gosto.

Link: [neovim/INSTALL.md at master · neovim/neovim · GitHub](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2)

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
&&
sudo rm -rf /opt/nvim 
&&
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

> Remova o diretório relativo ao neovim antigo no diretório opt/

```sh
micro ~/.bashrc
nano ~/.bashrc
```

```sh
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

> Insira essa linha. Se você está atualizando para um nova versão, a linha
com versão antiga já existe, então substitua pela mais nova.

```sh
source ~/.bashrc
```

### Instalando as dependências

```sh
apt install -y git make unzip gcc ripgrep fd-find xclip fonts-noto-color-emoji
```

Para ambiente Wayland, substitua xclip por wl-clipboard:

```sh
apt install -y git make unzip gcc ripgrep fd-find wl-clipboard fonts-noto-color-emoji
```

O tree-sitter agora tem como dependência obrigatória o tree-sitter-cli, e para instalar,
recomendo usar a versão do NPM, para pegar a versão mais nova (a versão apt é antiga):

```sh
npm install -g tree-sitter-cli
```

Instale via NPM o plugin markdownlint:

```sh
npm install -g markdownlint-cli
```

## Atualizando o neovim

Para atualizar é muito simples, se você já fez as etapas anteriores, é só executar:

Link: [neovim/INSTALL.md at master · neovim/neovim · GitHub](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2)

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
&&
sudo rm -rf /opt/nvim 
&&
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

## Instalando em um container Docker

> Para rodar esses comandos, só funcionam no Linux, pois o Make só tem para Linux.
> Para executar as configurações, dentro do container execute o comando 'nvim'.

### Instalando o neovim no Docker

```sh
make create_nvim
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
