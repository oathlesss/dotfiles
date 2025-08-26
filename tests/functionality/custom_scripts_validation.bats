#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "Custom scripts directory exists" {
  [ -d "${PROJECT_ROOT}/scripts" ]
}

@test "Tmux sessionizer script exists and is executable" {
  [ -f "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh" ]
  [ -x "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh" ]
}

@test "Tmux sessionizer script has valid syntax" {
  run bash -n "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh"
  [ "$status" -eq 0 ]
}

@test "All custom scripts have valid syntax" {
  # Check syntax of all shell scripts in scripts directory
  run bash -c "find '${PROJECT_ROOT}/scripts' -name '*.sh' -type f -exec bash -n {} \;"
  [ "$status" -eq 0 ]
}

@test "All custom scripts are executable" {
  run bash -c "find '${PROJECT_ROOT}/scripts' -name '*.sh' -type f -exec test -x {} \;"
  [ "$status" -eq 0 ]
}