#!/bin/bash

# Script to automatically sync Homebrew packages with dotfiles
# Usage: 
#   ./brew-sync.sh install <package> - Install package and add to leaves.txt
#   ./brew-sync.sh uninstall <package> - Uninstall package and remove from leaves.txt
#   ./brew-sync.sh update - Update package lists based on currently installed packages

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/.." >/dev/null 2>&1 && pwd)"
HOMEBREW_DIR="${DOTFILES_DIR}/homebrew"

LEAVES_FILE="${HOMEBREW_DIR}/leaves.txt"
CASKS_FILE="${HOMEBREW_DIR}/casks.txt"

# Ensure homebrew directory exists
mkdir -p "${HOMEBREW_DIR}"

# Function to check if a package is a cask
is_cask() {
    local package="$1"
    brew info --cask "$package" >/dev/null 2>&1
}

# Function to update leaves file with currently installed packages
update_leaves() {
    echo "Updating leaves.txt with currently installed formulae..."
    brew leaves -r > "${LEAVES_FILE}"
    # Sort the file for consistency
    sort "${LEAVES_FILE}" -o "${LEAVES_FILE}"
    echo "leaves.txt updated successfully!"
}

# Function to update casks file with currently installed casks
update_casks() {
    echo "Updating casks.txt with currently installed casks..."
    brew list --cask > "${CASKS_FILE}"
    # Sort the file for consistency
    sort "${CASKS_FILE}" -o "${CASKS_FILE}"
    echo "casks.txt updated successfully!"
}

# Function to add package to appropriate file
add_package() {
    local package="$1"
    
    if is_cask "$package"; then
        echo "Adding $package to casks.txt..."
        echo "$package" >> "${CASKS_FILE}"
        sort "${CASKS_FILE}" -o "${CASKS_FILE}"
    else
        echo "Adding $package to leaves.txt..."
        echo "$package" >> "${LEAVES_FILE}"
        sort "${LEAVES_FILE}" -o "${LEAVES_FILE}"
    fi
}

# Function to remove package from appropriate file
remove_package() {
    local package="$1"
    
    if is_cask "$package"; then
        echo "Removing $package from casks.txt..."
        grep -v "^${package}$" "${CASKS_FILE}" > "${CASKS_FILE}.tmp" && mv "${CASKS_FILE}.tmp" "${CASKS_FILE}"
    else
        echo "Removing $package from leaves.txt..."
        grep -v "^${package}$" "${LEAVES_FILE}" > "${LEAVES_FILE}.tmp" && mv "${LEAVES_FILE}.tmp" "${LEAVES_FILE}"
    fi
}

# Function to install package and update lists
install_package() {
    local package="$1"
    echo "Installing $package..."
    brew install "$package"
    add_package "$package"
}

# Function to uninstall package and update lists
uninstall_package() {
    local package="$1"
    echo "Uninstalling $package..."
    if is_cask "$package"; then
        brew uninstall --cask "$package"
    else
        brew uninstall "$package"
    fi
    remove_package "$package"
}

# Main logic
case "$1" in
    install)
        if [ -z "$2" ]; then
            echo "Usage: $0 install <package>"
            exit 1
        fi
        install_package "$2"
        ;;
    uninstall)
        if [ -z "$2" ]; then
            echo "Usage: $0 uninstall <package>"
            exit 1
        fi
        uninstall_package "$2"
        ;;
    update)
        update_leaves
        update_casks
        ;;
    *)
        echo "Usage: $0 {install|uninstall|update} [package]"
        echo "  install <package>   - Install package and add to appropriate list"
        echo "  uninstall <package> - Uninstall package and remove from appropriate list"
        echo "  update              - Update both lists based on currently installed packages"
        exit 1
        ;;
esac

echo "Operation completed successfully!"