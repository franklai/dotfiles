#!/bin/sh

# zsh
sudo apt install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/davidparsson/zsh-pyenv-lazy.git ~/.oh-my-zsh/custom/plugins/pyenv-lazy

# tmux
sudo apt install tmux

# Nix
curl -L https://nixos.org/nix/install | sh

nix-env -iA nixpkgs.diff-so-fancy \
            nixpkgs.silver-searcher \
            nixpkgs.ripgrep \
            nixpkgs.fd \
            ;

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 14

# PHP
sudo apt install php-cli

# pyenv
curl https://pyenv.run | bash


