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