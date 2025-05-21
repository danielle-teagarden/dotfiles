#!/bin/bash

echo "Fixing ZSH completion issues..."

# Remove Oh-My-Zsh cache
rm -f ~/.zcompdump*

# Create a directory for custom completions if it doesn't exist
mkdir -p ~/.oh-my-zsh/custom/completions

# Create an empty Docker completion file to override the problematic one
touch ~/.oh-my-zsh/custom/completions/_docker-compose

# Create a custom Oh-My-Zsh theme that overrides compinit to ignore missing files
mkdir -p ~/.oh-my-zsh/custom/lib
cat > ~/.oh-my-zsh/custom/lib/compinit.zsh << 'EOFINNER'
# Override compinit to ignore missing files
function compinit() {
  autoload -U +X compinit
  compinit -i -u -C
}
EOFINNER

# Update fpath to include our custom completions first
echo 'fpath=(~/.oh-my-zsh/custom/completions $fpath)' > ~/.oh-my-zsh/custom/fpath.zsh

# Disable docker plugin completely in case it's somehow still enabled
sed -i '' 's/plugins=(\(.*\)docker\(.*\))/plugins=(\1\2)/' ~/.zshrc

echo "Completion fixes applied. Please run: source ~/.zshrc"
