# Install a package and update dotfiles
brew-install package:
    #!/bin/bash
    set -e
    scripts/brew-sync.sh install {{package}}

# Uninstall a package and update dotfiles
brew-uninstall package:
    #!/bin/bash
    set -e
    scripts/brew-sync.sh uninstall {{package}}

# Update package lists based on currently installed packages
brew-update:
    #!/bin/bash
    set -e
    scripts/brew-sync.sh update

# Stow dotfiles
stow:
	#!/bin/bash
	set -e
	stow --restow .

# List all available just commands
help:
    just --list
