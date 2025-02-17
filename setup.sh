#!/bin/sh

# create directories
echo "creating directories..."
mkdir .config/nvim
mkdir .config/kitty

# symlink files
echo "symlinking files..."
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/kitty ~/.config/kitty

echo "init zsh plugins maintained as git submodules..."
cd .zsh && git submodule update --init --recursive
# to update
# git submodule update --remote --merge

# system setup
echo "installing tools..."
sudo dnf install zsh neovim ripgrep fd-find fzf zoxide eza gh bat kitty-terminfo -y
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit -y

echo "done"
