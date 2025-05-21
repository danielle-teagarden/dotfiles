# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Plugins
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

# Basic aliases
alias vim="nvim"
alias v="nvim"
alias lg="lazygit"
alias up="topgrade"
alias ls="ls -G"
alias ll="ls -la"
alias g="git"

# Git aliases
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"

# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias dotfiles="cd ~/dotfiles"

# Utility aliases
alias rr="rm -rf"
alias c="clear"
alias h="history"
alias reload="source ~/.zshrc"

# Development aliases
alias nd="npm run dev"
alias nb="npm run build"
alias ns="npm start"
alias nt="npm test"
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"

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

# Git add, commit, push in one command
gitacp() {
  git add .
  git commit -m "$1"
  git push
}

# Create a new directory and initialize git repo
ginit() {
  mkdir -p "$1" && cd "$1" && git init
}

# Extract most archive formats
extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find files by name
ff() {
  find . -type f -name "*$1*"
}

# Find files containing text
fft() {
  find . -type f -name "*$1*" -exec grep -l "$2" {} \;
}

# Show disk usage of current directory
duf() {
  du -h -d 1 "$@" | sort -hr
}

# Kill process by name
kp() {
  ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Weather forecast
weather() {
  curl -s wttr.in/"${1:-}"
}

# Create a new React component
react-component() {
  mkdir -p "$1"
  cat > "$1/index.jsx" << EOFINNER
import React from 'react';
import './$1.css';

const $1 = (props) => {
  return (
    <div className="$1">
      $1 Component
    </div>
  );
};

export default $1;
EOFINNER

  cat > "$1/$1.css" << EOFINNER
.$1 {
  display: flex;
  flex-direction: column;
}
EOFINNER

  echo "Created React component $1"
}
