#!/bin/sh

# zsh
sudo apt install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
sudo apt install tmux

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20

# Homebrew on Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
    diff-so-fancy \
    the_silver_searcher \
    ripgrep \
    fd \
    ;

# Nix
# curl -L https://nixos.org/nix/install | sh
#
# nix-env -iA nixpkgs.diff-so-fancy \
#             nixpkgs.silver-searcher \
#             nixpkgs.ripgrep \
#             nixpkgs.fd \
#             ;


# PHP
#sudo apt install php-cli

# pyenv
#curl https://pyenv.run | bash


