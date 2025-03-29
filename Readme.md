# Dotfiles

> Personal configuration files for macOS development environment

## Overview

This repository contains my personal dotfiles and configuration files for various tools and applications I use in my macOS development environment. These configurations are designed to work together to create a cohesive, efficient, and visually appealing setup.

## What's Included

### Shell Configuration
- `.zshrc` - ZSH configuration with conditional setup for different terminals (Ghostty, WezTerm)
- `.aliasses` - Custom aliases for common commands and workflows
- `.tmux.conf` - Tmux configuration with Vi keybindings and custom styling

### Terminal Emulators
- `ghostty/` - Configuration for Ghostty terminal
- `kitty/` - Configuration for Kitty terminal
- `wezterm/` - Configuration for WezTerm terminal

### Editors
- `nvim/` - Neovim configuration
- `lvim/` - LunarVim configuration
- `zed/` - Zed editor configuration

### Command Line Tools
- `fastfetch/` - System information display configuration
- `lazygit/` - Git TUI client configuration
- `ohmyposh/` - Oh My Posh prompt theme (zen.toml)
- `starship.toml` - Starship prompt configuration
- `smug/` - Tmux session manager configuration
- `vale/` - Prose linter configuration

## Terminal Prompt Themes
- **Oh My Posh** - Used with most terminals
- **Starship** - Alternative prompt used with WezTerm

## Key Features

- **Conditional Configuration**: Different setups based on the terminal emulator in use
- **Development Tools**: Support for multiple programming languages (Go, Python, Rust, Node.js)
- **Custom Aliases**: Productivity shortcuts for git, navigation, and common tasks
- **Terminal Multiplexing**: Tmux configuration with custom key bindings and visual styling
- **Modern CLI Tools**: Integration with tools like zoxide, fzf, exa, and more

## Installation

1. Clone this repository to your home directory:
   ```bash
   git clone --recurse-submodules https://github.com/abzcoding/dotfiles.git ~/dotfiles
   ```

2. Create symbolic links for the configuration files you want to use:
   ```bash
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   ln -s ~/dotfiles/.aliasses ~/.aliasses
   ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
   # Add more links as needed
   ```

3. For application-specific configs, create symbolic links to their expected locations:
   ```bash
   # For Oh My Posh
   ln -s ~/dotfiles/ohmyposh ~/.config/ohmyposh
   
   # For Starship
   ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
   
   # For terminal emulators and editors, link to their expected config locations
   # (paths may vary based on your system)
   ```

## Dependencies

These dotfiles rely on various tools that should be installed separately:

- Zsh shell
- Homebrew package manager
- Terminal emulators: WezTerm, Ghostty, or Kitty
- Tmux
- Neovim/LunarVim
- Zinit (Zsh plugin manager)
- Oh My Posh or Starship (shell prompts)
- Development tools: Go, Python, Rust, Node.js
- CLI utilities: zoxide, fzf, exa, pyenv, nvm

## Update

Many custom update commands are available through aliases:

- `update` - Update Homebrew packages, development tools, and more
- `update_bypass` - Update bypass-paywalls-chrome extension
- and more available at `~/.aliasses`

## License

This project is open-sourced under the MIT License.

## Acknowledgements

These dotfiles have been crafted over time and inspired by various sources in the developer community.
