#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "README installation instructions exist" {
  [ -f "${PROJECT_ROOT}/README.md" ]
  
  # Check that README contains installation steps
  run grep -q "Installation" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
  
  run grep -q "git clone" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
  
  run grep -q "stow" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
}

@test "Stow configuration is valid" {
  [ -f "${PROJECT_ROOT}/.stowrc" ]
  [ -f "${PROJECT_ROOT}/.stow-local-ignore" ]
  
  # Check that .stowrc has the correct target
  run grep -q "target=~/.config" "${PROJECT_ROOT}/.stowrc"
  [ "$status" -eq 0 ]
}

@test "Installation prerequisites are documented" {
  # Check that README mentions Homebrew
  run grep -q "Homebrew" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
  
  # Check that README mentions Git
  run grep -q "Git" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
}

@test "Package installation commands are documented" {
  # Check that README contains package installation commands
  run grep -q "brew install" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
  
  run grep -q "leaves.txt\|casks.txt" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
}

@test "Installation steps are in correct order" {
  # Check that git clone comes before stow
  run bash -c "grep -n 'git clone\|stow' '${PROJECT_ROOT}/README.md' | sort -n | cut -d: -f2- | grep -A1 'git clone' | grep 'stow'"
  [ "$status" -eq 0 ]
}

@test "Backup commands are documented" {
  # Check that backup commands exist
  run grep -q "brew leaves\|brew list" "${PROJECT_ROOT}/README.md"
  [ "$status" -eq 0 ]
}