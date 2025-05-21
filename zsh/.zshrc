# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Plugins (removed docker)
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  npm
  node
  rust
)

source $ZSH/oh-my-zsh.sh

# Install missing plugins if needed
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# User configuration
export PATH="$HOME/.cargo/bin:$PATH"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Starship prompt
eval "$(starship init zsh)"

# Aliases
alias vim="nvim"
alias v="nvim"
alias lg="lazygit"
alias up="topgrade"
alias ls="ls -G"
alias ll="ls -la"
alias g="git"

# Load Z (directory jumper) if it exists
if [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi

# FZF configuration (if installed)
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Custom functions
# Quickly create and cd into a directory
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Git add, commit, push
gitacp() {
  git add .
  git commit -m "$1"
  git push
}
