#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "SketchyBar configuration files exist" {
  [ -f "${PROJECT_ROOT}/sketchybar/sketchybarrc" ]
  [ -f "${PROJECT_ROOT}/sketchybar/colors.sh" ]
}

@test "SketchyBar shell scripts have valid syntax" {
  # Check syntax of all shell scripts in sketchybar directory
  run bash -c "find '${PROJECT_ROOT}/sketchybar' -name '*.sh' -type f -exec bash -n {} \;"
  [ "$status" -eq 0 ]
}

@test "SketchyBar main configuration can be parsed" {
  # Check that the main config file has valid syntax
  run bash -n "${PROJECT_ROOT}/sketchybar/sketchybarrc"
  [ "$status" -eq 0 ]
}

@test "All SketchyBar plugin scripts are executable" {
  run bash -c "find '${PROJECT_ROOT}/sketchybar/plugins' -name '*.sh' -type f -exec test -x {} \;"
  [ "$status" -eq 0 ]
}

@test "All SketchyBar item scripts are executable" {
  run bash -c "find '${PROJECT_ROOT}/sketchybar/items' -name '*.sh' -type f -exec test -x {} \;"
  [ "$status" -eq 0 ]
}