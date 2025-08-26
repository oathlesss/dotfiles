#!/usr/bin/env bats

setup() {
  # Get the directory where this script is located
  SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" >/dev/null 2>&1 && pwd)"
  # Navigate to the project root
  PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 && pwd)"
}

@test "GitHub Actions workflow file exists" {
  [ -f "${PROJECT_ROOT}/.github/workflows/test.yml" ]
}

@test "GitHub Actions workflow has proper structure" {
  # Check for essential components
  run grep -q "name: Test Dotfiles" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
  
  run grep -q "on:" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
  
  run grep -q "jobs:" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
}

@test "GitHub Actions workflow defines test jobs" {
  # Check for test job definition
  run grep -q "test:" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
  
  # Check for runs-on specification
  run grep -q "runs-on: macos-latest" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
}

@test "GitHub Actions workflow installs required dependencies" {
  # Check for dependency installation steps
  run grep -q "brew install bats-core yamllint shellcheck lua" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
}

@test "GitHub Actions workflow runs all test suites" {
  # Check for test execution steps
  run grep -q "bats -r tests/syntax/" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
  
  run grep -q "bats -r tests/functionality/" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
  
  run grep -q "bats -r tests/install/" "${PROJECT_ROOT}/.github/workflows/test.yml"
  [ "$status" -eq 0 ]
}