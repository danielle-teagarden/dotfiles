#!/bin/bash
DOTFILES="$HOME/dotfiles"

# Create symbolic links
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# Setup Neovim config if it exists
if [ -d "$DOTFILES/neovim" ]; then
  mkdir -p "$HOME/.config/nvim"
  ln -sf "$DOTFILES/neovim/init.vim" "$HOME/.config/nvim/init.vim" 2>/dev/null
  ln -sf "$DOTFILES/neovim/init.lua" "$HOME/.config/nvim/init.lua" 2>/dev/null
fi

echo "Dotfiles installed!"
