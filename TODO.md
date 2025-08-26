# Dotfiles TODO List

## ✅ Completed Tasks
- [x] Research existing testing frameworks for dotfiles (Bats, pytest, shellcheck)
- [x] Create tests directory structure (syntax/, functionality/, integration/, install/)
- [x] Write syntax validation tests for config files (TOML, YAML, shell scripts)
- [x] Test nvim configuration loads without errors
- [x] Test tmux configuration syntax and functionality
- [x] Test sketchybar scripts execute without errors
- [x] Test shell scripts in scripts/ directory functionality
- [x] Write test for symlink validation and broken link detection
- [x] Add GNU Stow configuration validation test
- [x] Create script to validate all package dependencies exist
- [x] Setup GitHub Actions workflow for automated CI/CD testing
- [x] Add automated package list management script
- [x] Write integration tests for tool interactions (tmux + nvim, etc)
- [x] Create installation script validation tests
- [x] Create comprehensive package validation tests

## 🟡 In Progress
- [ ] Create Docker-based installation tests for clean system testing
- [ ] Create backup/restore functionality test

## 🔲 Backlog
- [ ] Add automated screenshot generation for README