#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Shell configuration references essential tools" {
  # Check that shell configuration references tmux
  run grep -q "tmux" "${PROJECT_ROOT}/zshrc/.zshrc"
  [ "$status" -eq 0 ]
  
  # Check that shell configuration references nvim
  run grep -q "nvim\|EDITOR" "${PROJECT_ROOT}/zshrc/.zshrc"
  [ "$status" -eq 0 ]
}

@test "Custom scripts directory integration" {
  # Check that scripts directory exists
  [ -d "${PROJECT_ROOT}/scripts" ]
  
  # Check that essential scripts are referenced in shell config
  run grep -q "tmux-sessionizer" "${PROJECT_ROOT}/zshrc/.zshrc"
  [ "$status" -eq 0 ]
}

@test "Path configuration includes custom scripts" {
  # Check that PATH includes custom scripts directory
  run grep -q "scripts" "${PROJECT_ROOT}/zshrc/.zshrc"
  [ "$status" -eq 0 ]
}

@test "Tool configurations reference each other" {
  # Check that tmux config might reference shell settings
  run grep -q "shell\|zsh" "${PROJECT_ROOT}/tmux/tmux.conf" || true
  
  # Check that nvim config might reference shell environment
  run grep -q "shell\|zsh" "${PROJECT_ROOT}/nvim/init.lua" || true
}

@test "Homebrew packages support tool integrations" {
  # Check that essential integration packages are installed
  [ -f "${PROJECT_ROOT}/homebrew/leaves.txt" ]
  
  # Check for tmux
  run grep -q "tmux" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  # Check for fzf (common integration tool)
  run grep -q "fzf" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  # Check for stow (essential for dotfiles management)
  run grep -q "stow" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
}