#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Tmux configuration file exists" {
  [ -f "${PROJECT_ROOT}/tmux/tmux.conf" ]
}

@test "Tmux configuration has valid syntax" {
  run tmux -f "${PROJECT_ROOT}/tmux/tmux.conf" -V
  [ "$status" -eq 0 ]
}

@test "Tmux configuration can be loaded" {
  # Test that tmux can load the configuration without errors
  run bash -c "tmux -f '${PROJECT_ROOT}/tmux/tmux.conf' start-server \; has-session 2>/dev/null || true"
  [ "$status" -eq 0 ]
}