# Run all BATS tests
test: setup
    #!/bin/bash
    set -e
    
    # Run all .bats files recursively
    echo "Running BATS tests..."
    bats tests/**/*.bats
    
    echo "All tests completed!"

# Setup test environment
setup:
    #!/bin/bash
    set -e
    
    # Check if bats is installed
    if ! command -v bats &> /dev/null; then
        echo "Error: bats is not installed. Please install it first:"
        echo "  brew install bats-core"
        exit 1
    fi
    
    # Check if uv is installed
    if ! command -v uv &> /dev/null; then
        echo "Error: uv is not installed. Please install it first:"
        echo "  curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
    
    # Setup Python virtual environment for tomlcheck
    echo "Setting up Python environment for tomlcheck..."
    cd tests
    if [ ! -d ".venv" ]; then
        uv venv
    fi
    uv pip install tomlcheck

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

# List all available just commands
help:
    just --list