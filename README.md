<div align="center">

<img src="https://capsule-render.vercel.app/api?type=blur&height=300&color=gradient&text=~/dotfiles&textBg=false&reversal=false" alt="Dotfiles Banner"/>

<br/>
<img src="https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logoColor=black" alt="Platform: macOS"/>
<img src="https://img.shields.io/github/stars/oathlesss/dotfiles?style=for-the-badge" alt="Stars"/>
<img src="https://img.shields.io/github/forks/oathlesss/dotfiles?style=for-the-badge" alt="Forks"/>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-02569B?style=for-the-badge" alt="License: MIT"/></a>
<a href="https://github.com/oathlesss/dotfiles/actions/workflows/test.yml"><img src="https://github.com/oathlesss/dotfiles/actions/workflows/test.yml/badge.svg" alt="Test Status"/></a>

_A carefully curated collection of configuration files for a productive development environment_

</div>

## 📸 Screenshots

<div align="center">
  <img src="./docs/images/nvim.png" alt="Terminal Setup"/>
</div>

<!-- _For more screenshots, see [Showcase](docs/showcase.md)_ -->

## 📦 What's Inside

This repository contains configuration files for various tools and applications:

- **[zshrc](zshrc/)** - Z Shell configuration
- **[nvim](nvim/)** - Neovim configuration
- **[tmux](tmux/)** - Terminal multiplexer configuration
- **[kitty](kitty/)** - GPU-based terminal emulator
- **[sketchybar](sketchybar/)** - macOS status bar replacement
- **[aerospace](aerospace/)** - Window manager for macOS
- **[oh-my-posh](oh-my-posh/)** - Prompt theme engine
- **[homebrew](homebrew/)** - Package manager backup
- **[wallpapers](wallpapers/)** - Custom wallpapers

## 🚀 Installation

### Prerequisites

**Homebrew**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Git & Stow**

```bash
brew install git stow
```

### Setup Steps

**1. Clone**

```bash
cd ~ && git clone git@github.com:oathlesss/dotfiles.git
cd dotfiles
```

**2. Symlink**

```bash
stow .
```

**3. Configure ZSH**

```bash
echo 'export ZDOTDIR="$HOME/.config/zshrc"' >> ~/.zshenv
```

**4. Install Packages**

```bash
xargs brew install < ~/.config/homebrew/leaves.txt
xargs brew install --cask < ~/.config/homebrew/casks.txt
```

### Backup Homebrew Packages

```bash
brew leaves -r > ~/.config/homebrew/leaves.txt
brew list --cask > ~/.config/homebrew/casks.txt
```

### Additional Setup

Some components require additional setup steps after installation:

- **SketchyBar**: See [SketchyBar README](sketchybar/README.md) for icons installation and configuration steps
- **Tmux**: See [TMUX README](tmux/README.md) for TPM installation and plugin setup

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [GNU Stow](https://www.gnu.org/software/stow/) for symlink management
- All the open-source projects that made these configurations possible
- [PraveenGongada](https://github.com/PraveenGongada/dotfiles) for the initial dotfiles
