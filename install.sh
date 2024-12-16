#!/bin/bash

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "Error: tmux is not installed."
fi

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Error: zsh is not installed."
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "Error: fzf is not installed."
fi

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Setup tmux
if [[ -f "$HOME/.tmux.conf" || -L "$HOME/.tmux.conf" ]]; then
    echo "File .tmux.conf already exists. Backing it up as .tmux.conf_org."
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf_org"
fi
echo "Creating symlink: ~/.tmux.conf -> $REPO_DIR/.tmux.conf"
ln -s $REPO_DIR/.tmux.conf $HOME/.tmux.conf

# Setup zsh
if [ ! -d "$HOME/.oh-my-zsh" ] 
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Setup Zsh plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Setup Zsh plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ -f "$HOME/.zshrc" || -L "$HOME/.zshrc" ]]; then
    echo "File .zshrc already exists. Backing it up as .zshrc_org."
    mv "$HOME/.zshrc" "$HOME/.zshrc_org"
fi
echo "Creating symlink: ~/.zshrc -> $REPO_DIR/.zshrc"
ln -s $REPO_DIR/.zshrc $HOME/.zshrc

if [[ -f "$HOME/.oh-my-zsh/custom/themes/erik.zsh-theme" || -L "$HOME/.oh-my-zsh/custom/themes/erik.zsh-theme" ]];
then
    mv "$HOME/.oh-my-zsh/custom/themes/erik.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/erik.zsh-theme_org"
fi
echo "Creating symlink: $HOME/.oh-my-zsh/custom/themes/erik.zsh-theme -> $REPO/erik.zsh-theme"
ln -s $REPO_DIR/erik.zsh-theme $HOME/.oh-my-zsh/custom/themes/erik.zsh-theme
