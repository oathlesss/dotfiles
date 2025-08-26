#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root (3 levels up from tests/syntax)
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
  # Activate virtual environment for tomlcheck
  source "${PROJECT_ROOT}/.venv/bin/activate"
}

@test "All TOML files are valid" {
  run bash -c "find '${PROJECT_ROOT}' -name '*.toml' -type f -not -path '*/.git/*' -exec tomlcheck {} \;"
  [ "$status" -eq 0 ]
}

@test "All YAML files are valid" {
  run bash -c "find '${PROJECT_ROOT}' -name '*.y*ml' -type f -not -path '*/.git/*' -exec yamllint {} \;"
  [ "$status" -eq 0 ]
}

@test "All shell scripts pass shellcheck" {
  run bash -c "find '${PROJECT_ROOT}' -name '*.sh' -type f -not -path '*/.git/*' -exec shellcheck {} \;"
  [ "$status" -eq 0 ]
}

@test "All JSON files are valid" {
  run bash -c "find '${PROJECT_ROOT}' -name '*.json' -type f -not -path '*/.git/*' -exec python3 -m json.tool {} \;"
  [ "$status" -eq 0 ]
}