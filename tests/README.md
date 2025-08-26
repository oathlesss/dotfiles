# Dotfiles Tests

This directory contains automated tests for validating the dotfiles configuration.

## Directory Structure

- `syntax/` - Configuration file syntax validation
- `functionality/` - Tool functionality tests
- `integration/` - Cross-tool integration tests
- `install/` - Installation process tests

## Running Tests

### Prerequisites

Install testing dependencies:

```bash
# Install bats for shell testing
brew install bats-core yamllint shellcheck lua

# Create virtual environment and install Python dependencies
uv venv
source .venv/bin/activate
uv pip install tomlcheck
```

### Run All Tests

```bash
bats -r tests/
```

### Run Specific Test Suites

```bash
# Syntax validation tests
bats tests/syntax/config_validation.bats

# Functionality tests
bats -r tests/functionality/

# Integration tests
bats -r tests/integration/

# Installation tests
bats -r tests/install/
```

## Continuous Integration

Tests are automatically run on GitHub Actions for every push and pull request to the main branch. The workflow is defined in `.github/workflows/test.yml`.

The CI pipeline:
1. Sets up a macOS environment
2. Installs all required dependencies
3. Runs all test suites (syntax, functionality, and installation)
4. Reports results via GitHub Checks