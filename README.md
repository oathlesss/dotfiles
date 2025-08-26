# Dotfiles

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=blur&amp;height=300&amp;color=gradient&amp;text=~/dotfiles&amp;textBg=false&amp;reversal=false" alt="Dotfiles Banner"/>

<br/>
<img src="https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&amp;logoColor=black" alt="Platform: macOS"/>
<img src="https://img.shields.io/github/stars/oathlesss/dotfiles?style=for-the-badge" alt="Stars"/>
<img src="https://img.shields.io/github/forks/oathlesss/dotfiles?style=for-the-badge" alt="Forks"/>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-02569B?style=for-the-badge" alt="License: MIT"/></a>
<a href="https://github.com/oathlesss/dotfiles/actions/workflows/test.yml"><img src="https://github.com/oathlesss/dotfiles/actions/workflows/test.yml/badge.svg" alt="Test Status"/></a>

_A carefully curated collection of configuration files for a productive development environment_

</div>

## 📸 Screenshots

<div align="center">
  <img src="./docs/images/nvim.png" alt="Neovim Setup"/>
</div>

_For more screenshots, see [Showcase](docs/showcase.md)_

## 📦 What's Inside

This repository contains configuration files for various tools and applications:

- **[zshrc](zshrc/)** - Z Shell configuration
- **[nvim](nvim/)** - Neovim configuration
- **[tmux](tmux/)** - Terminal multiplexer configuration
- **[kitty](kitty/)** - GPU-based terminal emulator
- **[sketchybar](sketchybar/)** - macOS status bar replacement
- **[aerospace](aerospace/)** - Window manager for macOS
- **[ghostty](ghostty/)** - Terminal emulator configuration
- **[git](git/)** - Git configuration
- **[homebrew](homebrew/)** - Package manager backup
- **[wallpapers](wallpapers/)** - Custom wallpapers
- **[muxyard](muxyard/)** - Mux configuration
- **[scripts](scripts/)** - Utility scripts

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

**Just**

```bash
brew install just
```

### Setup Steps

**1. Clone**

```bash
cd ~ && git clone git@github.com:oathlesss/dotfiles.git
cd dotfiles
```

**2. Symlink**

```bash
just stow
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
just brew-update
```

### Additional Setup

Some components require additional setup steps after installation:

- **SketchyBar**: See [SketchyBar README](sketchybar/README.md) for icons installation and configuration steps
- **Tmux**: See [TMUX README](tmux/README.md) for TPM installation and plugin setup
- **Neovim**: See [Neovim Docs](nvim/docs/) for customization, adding plugins/LSP, and troubleshooting

## 🛠️ Usage with Justfile

The justfile provides convenient commands for managing the dotfiles:

- `just stow` - Symlink configurations
- `just brew-install <package>` - Install a Homebrew package and update lists
- `just brew-uninstall <package>` - Uninstall a Homebrew package and update lists
- `just brew-update` - Update package lists from installed packages
- `just test` - Run all BATS tests
- `just help` - List all commands

Install Just if not already: `brew install just`

## 🧪 Testing

This project includes comprehensive tests using BATS (Bash Automated Testing System).

### Running Tests

1. Install BATS: `brew install bats-core`
2. Run all tests: `just test`

Tests are organized in the [tests/](tests/) directory and cover:
- Syntax and configuration validation
- Symlink validation
- Integration tests for tools like Neovim, Tmux, Sketchybar
- Installation script validation
- Custom script functionality

CI tests run on every push via GitHub Actions.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [GNU Stow](https://www.gnu.org/software/stow/) for symlink management
- All the open-source projects that made these configurations possible
- [PraveenGongada](https://github.com/PraveenGongada/dotfiles) for the initial dotfiles
