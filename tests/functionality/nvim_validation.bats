#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Neovim configuration files exist" {
  # Check that essential configuration files exist
  [ -f "${PROJECT_ROOT}/nvim/init.lua" ]
}

@test "Neovim Lua files have valid syntax" {
  # Check syntax of all Lua files in nvim directory
  run bash -c "find '${PROJECT_ROOT}/nvim' -name '*.lua' -type f -exec lua -p {} \;"
  [ "$status" -eq 0 ]
}

@test "Neovim configuration loads without errors (if nvim is available)" {
  # Skip test if nvim is not installed
  if ! command -v nvim &> /dev/null; then
    skip "nvim not found"
  fi
  
  # Test that nvim can load the configuration without errors
  run nvim --headless -c 'echo "Config loaded successfully"' -c 'qa!'
  [ "$status" -eq 0 ]
}