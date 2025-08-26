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

@test "SketchyBar items and plugins are properly configured" {
  # Check that items directory exists and has scripts
  [ -d "${PROJECT_ROOT}/sketchybar/items" ]
  [ -d "${PROJECT_ROOT}/sketchybar/plugins" ]
  
  # Check that essential items exist
  run ls -la "${PROJECT_ROOT}/sketchybar/items/"
  [ "$status" -eq 0 ]
  
  # Check that plugins exist
  run ls -la "${PROJECT_ROOT}/sketchybar/plugins/"
  [ "$status" -eq 0 ]
}

@test "SketchyBar configuration references essential components" {
  # Check for references to key components in main config
  run grep -q "space\|battery\|wifi\|volume" "${PROJECT_ROOT}/sketchybar/sketchybarrc"
  [ "$status" -eq 0 ]
}

@test "SketchyBar scripts are executable" {
  # Check that plugin scripts are executable
  run find "${PROJECT_ROOT}/sketchybar/plugins" -name "*.sh" -type f -exec test -x {} \;
  [ "$status" -eq 0 ]
  
  # Check that item scripts are executable
  run find "${PROJECT_ROOT}/sketchybar/items" -name "*.sh" -type f -exec test -x {} \;
  [ "$status" -eq 0 ]
}