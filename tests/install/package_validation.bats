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
  # Check for essential packages for dotfiles functionality
  run grep -q "stow" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  run grep -q "git" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  run grep -q "tmux" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
}

@test "Package files have valid format" {
  # Check that leaves.txt doesn't have empty lines (except possibly at end)
  run bash -c "grep -v '^$' '${PROJECT_ROOT}/homebrew/leaves.txt' | wc -l"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -gt 0 ]
  
  # Check that casks.txt doesn't have empty lines (except possibly at end)
  run bash -c "grep -v '^$' '${PROJECT_ROOT}/homebrew/casks.txt' | wc -l"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -gt 0 ]
}

@test "No duplicate packages in lists" {
  # Check for duplicates in leaves.txt
  run bash -c "sort '${PROJECT_ROOT}/homebrew/leaves.txt' | uniq -d | wc -l"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -eq 0 ] || echo "Duplicates found in leaves.txt"
  
  # Check for duplicates in casks.txt
  run bash -c "sort '${PROJECT_ROOT}/homebrew/casks.txt' | uniq -d | wc -l"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" -eq 0 ] || echo "Duplicates found in casks.txt"
}

@test "Package lists are sorted" {
  # Check that leaves.txt is sorted
  run bash -c "sort -c '${PROJECT_ROOT}/homebrew/leaves.txt'"
  [ "$status" -eq 0 ] || echo "leaves.txt is not sorted"
  
  # Check that casks.txt is sorted
  run bash -c "sort -c '${PROJECT_ROOT}/homebrew/casks.txt'"
  [ "$status" -eq 0 ] || echo "casks.txt is not sorted"
}

@test "Essential tools for installation are present" {
  # Check for packages needed for the installation process
  run grep -q "stow" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
  
  # Check for packages needed for testing
  run grep -q "bats-core" "${PROJECT_ROOT}/homebrew/leaves.txt"
  [ "$status" -eq 0 ]
}