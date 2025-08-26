#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Brew sync script exists and is executable" {
  [ -f "${PROJECT_ROOT}/scripts/brew-sync.sh" ]
  [ -x "${PROJECT_ROOT}/scripts/brew-sync.sh" ]
}

@test "Brew sync script has valid syntax" {
  run bash -n "${PROJECT_ROOT}/scripts/brew-sync.sh"
  [ "$status" -eq 0 ]
}

@test "Homebrew package files exist" {
  [ -f "${PROJECT_ROOT}/homebrew/leaves.txt" ]
  [ -f "${PROJECT_ROOT}/homebrew/casks.txt" ]
}

@test "Homebrew leaves file is not empty" {
  [ -s "${PROJECT_ROOT}/homebrew/leaves.txt" ]
}

@test "Homebrew casks file is not empty" {
  [ -s "${PROJECT_ROOT}/homebrew/casks.txt" ]
}

@test "Essential packages are listed in leaves.txt" {
  # Check for some essential packages that should always be present
  run grep -q "stow" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  run grep -q "git" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
}

@test "Justfile contains brew commands" {
  [ -f "${PROJECT_ROOT}/justfile" ]
  
  # Check that justfile contains the new brew commands
  run grep -q "brew-install" "${PROJECT_ROOT}/justfile"
  [ "$status" -eq 0 ]
  
  run grep -q "brew-uninstall" "${PROJECT_ROOT}/justfile"
  [ "$status" -eq 0 ]
  
  run grep -q "brew-update" "${PROJECT_ROOT}/justfile"
  [ "$status" -eq 0 ]
}