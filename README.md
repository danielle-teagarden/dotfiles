# Danielle's Dotfiles

My personal development environment setup for macOS, optimized for iOS, React, and Rust development.

## What's Included

- **Zsh Configuration**: Custom prompt, aliases, and functions using Oh My Zsh
- **Git Configuration**: Useful aliases and settings
- **Tmux Setup**: Terminal multiplexer configuration
- **Neovim Configuration**: Modern editor setup
- **Starship Prompt**: Cross-shell prompt
- **Development Tools**: Support for iOS, React, Rust, and more

## Installation

### On a New Machine

```bash
# Clone the repository
git clone git@github.com:danielle-teagarden/dotfiles.git ~/dotfiles

# Run the installation script
cd ~/dotfiles
./install.sh
```

### Manual Updates

To update your dotfiles after making changes:

```bash
# Apply symlinks
cd ~/dotfiles
./setup.sh
```

## Key Features

### Aliases

#### General
- `v` - Opens Neovim
- `lg` - Opens Lazygit
- `up` - Runs Topgrade to update everything
- `ll` - Lists files with details
- `c` - Clear terminal
- `reload` - Reloads zsh configuration

#### Git
- `gs` - Git status
- `gc` - Git commit
- `gp` - Git push
- `gl` - Git pull
- `gco` - Git checkout
- `gb` - Git branch
- `gd` - Git diff

#### Navigation
- `..` - Go up one directory
- `...` - Go up two directories
- `....` - Go up three directories
- `~` - Go to home directory
- `dotfiles` - Go to dotfiles directory

#### Development
- `nd` - npm run dev
- `nb` - npm run build
- `ns` - npm start
- `nt` - npm test
- `cb` - cargo build
- `cr` - cargo run
- `ct` - cargo test

### Functions

- `mkcd folder` - Creates and enters a directory
- `gitacp "commit message"` - Git add, commit, and push in one command
- `ginit folder` - Create a directory and initialize git
- `extract file` - Extract various archive formats
- `ff pattern` - Find files by name
- `fft pattern text` - Find files containing text
- `duf` - Show disk usage of current directory
- `kp process` - Kill process by name
- `weather [location]` - Show weather forecast
- `react-component name` - Create a new React component

## Customization

The dotfiles are organized by topic:

- `zsh/` - Shell configuration
- `tmux/` - Terminal multiplexer settings
- `git/` - Git configuration
- `neovim/` - Neovim settings (if used)

## Utility Scripts

- `install.sh` - Sets up a new machine with all dependencies
- `setup.sh` - Creates symbolic links for configuration files
- `update.sh` - Pulls the latest changes from GitHub
- `backup.sh` - Backs up current configurations to the repository

## Recommended Tools

- **iTerm2** - Better terminal for macOS
- **Raycast** - Launcher and productivity tool
- **Rectangle** - Window management
- **Neovim** - Modern text editor
- **Lazygit** - Terminal UI for git
- **Starship** - Cross-shell prompt

## Credits

Inspired by numerous dotfiles repositories in the community and customized for my personal workflow.

## License

MIT