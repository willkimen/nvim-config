# My kickstart.nvim

## Get clone

```sh
git clone git@github.com:willkimen/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Instalação do Neovim 0.11 

> Esse link te leva para opção de Pre-built archives, que é a maneira que eu gosto.

Link: [neovim/INSTALL.md at master · neovim/neovim · GitHub](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
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

> Insira essa linha, se você está atualizando para um nova versão, a linha 
com versão antiga já existe, então substitua pela mais nova.

```python
source ~/.bashrc
```


## Instalando as dependências 

```sh
apt install -y git make unzip gcc ripgrep fd-find
```

Link: [Node.js — Download Node.js®](https://nodejs.org/en/download/package-manager)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

```sh
nvm install 20
```

## Ponto importante  
Em ~/.local/share/ existe um diretório chamado nvim/, você pode remover esse diretório 
se tiver com problema de erros que não desaparecem mesmo atualiznado plugin. Quando você rodar Lazy update ou 
coisa do tipo, ele será criado novamente, mas agora com uma instalação limpa do plugins. 
Eu tinha atualizando um plugin, eu acho que era o mason, e estava dando problema. A solucão
era atualizando o nvim para nvim 0.11, mas mesmo atualizando, gera outros erros. Eu apaguei esse diretorio, 
atualizei novamente e funcionou.
