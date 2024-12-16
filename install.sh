#!/bin/bash

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "Error: tmux is not installed."
fi

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Error: zsh is not installed."
fi

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Setup tmux
if [[ -f "$HOME/.tmux.conf" || -L "$HOME/.tmux.conf" ]]; then
    echo "File .tmux.conf already exists. Backing it up as .tmux.conf_org."
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf_org"
fi
echo "Creating symlink: ~/.tmux.conf -> $REPO_DIR/.tmux.conf"
ln -s $REPO_DIR/.tmux.conf ~/.tmux.conf

# Setup zsh
if [ ! -d "$HOME/.oh-my-zsh" ] 
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ -f "$HOME/.zshrc" || -L "$HOME/.zshrc" ]]; then
    echo "File .zshrc already exists. Backing it up as .zshrc_org."
    mv "$HOME/.zshrc" "$HOME/.zshrc_org"
fi
echo "Creating symlink: ~/.zshrc -> $REPO_DIR/.zshrc"
ln -s $REPO_DIR/.zshrc ~/.zshrc

echo "Creating symlink: ~/.oh-my-zsh/custom/themes/erik.zsh-theme -> $REPO/erik.zsh-theme
