#!/bin/bash

echo "Installing dotfiles..."

# Install from Brewfile
echo "Installing Homebrew packages..."
# Use --no-quarantine to avoid permission issues with some apps
HOMEBREW_NO_AUTO_UPDATE=1 brew bundle --file=~/dotfiles/Brewfile || true

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Zsh plugins
echo "Installing Zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Run setup script to create symlinks
echo "Setting up symlinks..."
./setup.sh

echo "Installation complete! Restart your terminal or run 'source ~/.zshrc'"
