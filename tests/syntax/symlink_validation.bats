#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "No broken symlinks in dotfiles directory" {
  # Check for broken symlinks
  run bash -c "find '${PROJECT_ROOT}' -type l -exec test ! -e {} \; -print"
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 0 ] || echo "Broken symlinks found: ${lines[*]}"
}

@test "Stow configuration files exist" {
  [ -f "${PROJECT_ROOT}/.stowrc" ]
  [ -f "${PROJECT_ROOT}/.stow-local-ignore" ]
}

@test "Stow target directory is correctly configured" {
  run grep "target=~/.config" "${PROJECT_ROOT}/.stowrc"
  [ "$status" -eq 0 ]
}

@test "Ignore patterns are properly configured" {
  run test -f "${PROJECT_ROOT}/.stow-local-ignore"
  [ "$status" -eq 0 ]
  
  # Check that essential ignore patterns exist
  run grep "\.git" "${PROJECT_ROOT}/.stow-local-ignore"
  [ "$status" -eq 0 ]
  
  run grep "README" "${PROJECT_ROOT}/.stow-local-ignore"
  [ "$status" -eq 0 ]
}

@test "Directory structure is valid for stow" {
  # Check that top-level directories exist for stowing
  [ -d "${PROJECT_ROOT}/zshrc" ]
  [ -d "${PROJECT_ROOT}/nvim" ]
  [ -d "${PROJECT_ROOT}/tmux" ]
  [ -d "${PROJECT_ROOT}/kitty" ]
  [ -d "${PROJECT_ROOT}/sketchybar" ]
}

@test "Configuration files have proper permissions" {
  # Check that shell configuration is readable
  [ -r "${PROJECT_ROOT}/zshrc/.zshrc" ]
  
  # Check that tmux configuration is readable
  [ -r "${PROJECT_ROOT}/tmux/tmux.conf" ]
  
  # Check that nvim configuration is readable
  [ -r "${PROJECT_ROOT}/nvim/init.lua" ]
}

@test "Essential tool configurations exist" {
  # Check that all major tool configurations are present
  [ -f "${PROJECT_ROOT}/zshrc/.zshrc" ]
  [ -f "${PROJECT_ROOT}/tmux/tmux.conf" ]
  [ -f "${PROJECT_ROOT}/nvim/init.lua" ]
  [ -f "${PROJECT_ROOT}/sketchybar/sketchybarrc" ]
  [ -f "${PROJECT_ROOT}/kitty/kitty.conf" ]
}