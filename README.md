# My kickstart.nvim

## Get clone

```sh
git clone git@github.com:willkimen/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Nvim installation

Link: [neovim/INSTALL.md at master · neovim/neovim · GitHub](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2)

```sh
apt -y curl 
```

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
```

```sh
rm -rf /opt/nvim
```

```sh
tar -C /opt -xzf nvim-linux64.tar.gz
```

### Set Enviroment

```sh
nano ~/.bashrc
```

Add this line.

```sh
export PATH="$PATH:/opt/nvim-linux64/bin"
```

```sh
source ~/.bashrc
```

## Dependecies install

```sh
apt install -y git make unzip gcc ripgrep
```

Link: [Node.js — Download Node.js®](https://nodejs.org/en/download/package-manager)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

```sh
nvm install 20
```
