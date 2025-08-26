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

@test "Tmux sessionizer script integration works" {
  # Check that the tmux sessionizer script exists
  [ -f "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh" ]
  [ -x "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh" ]
  
  # Test that it has the correct shebang
  run head -n 1 "${PROJECT_ROOT}/scripts/tmux-sessionizer.sh"
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" == "#!/usr/bin/env bash"* ]]
}

@test "Tmux configuration references sessionizer script correctly" {
  # Check that shell configuration references the sessionizer script
  run grep -q "tmux-sessionizer" "${PROJECT_ROOT}/zshrc/.zshrc"
  [ "$status" -eq 0 ]
}

@test "Tmux configuration has proper key bindings" {
  # Check for essential key bindings
  run grep -q "prefix" "${PROJECT_ROOT}/tmux/tmux.conf"
  [ "$status" -eq 0 ]
  
  # Check for pane navigation bindings
  run grep -q "C-h\|C-j\|C-k\|C-l" "${PROJECT_ROOT}/tmux/tmux.conf"
  [ "$status" -eq 0 ]
}