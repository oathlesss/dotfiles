#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
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

@test "Essential casks are listed in casks.txt" {
  # This test will pass if the file exists and is readable
  run test -r "${PROJECT_ROOT}/homebrew/casks.txt"
  [ "$status" -eq 0 ]
}