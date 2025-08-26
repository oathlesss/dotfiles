#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Neovim configuration files exist" {
  [ -f "${PROJECT_ROOT}/nvim/init.lua" ]
}

@test "Neovim configuration references essential plugins" {
  # Check that init.lua references key plugin configurations
  run grep -q "lazy" "${PROJECT_ROOT}/nvim/init.lua" || grep -q "packer" "${PROJECT_ROOT}/nvim/init.lua"
  [ "$status" -eq 0 ]
}

@test "Neovim LSP configuration exists" {
  # Check that LSP configuration files exist
  [ -d "${PROJECT_ROOT}/nvim/lsp" ]
  
  # Check for common LSP configuration files
  run ls -la "${PROJECT_ROOT}/nvim/lsp/"
  [ "$status" -eq 0 ]
  
  # Check that there are lua files in the lsp directory
  run bash -c "ls ${PROJECT_ROOT}/nvim/lsp/*.lua 2>/dev/null | wc -l"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -gt 0 ]
}

@test "Neovim keybindings configuration exists" {
  # Check that keybindings are configured
  run grep -q "keybind\|map" "${PROJECT_ROOT}/nvim/lua/core/keybinds.lua" 2>/dev/null || \
      grep -q "keybind\|map" "${PROJECT_ROOT}/nvim/init.lua" 2>/dev/null
  [ "$status" -eq 0 ]
}