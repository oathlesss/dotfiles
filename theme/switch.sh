#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <theme-name>" >&2
  exit 1
fi

THEME="$1"
OS="$(uname -s)"
THEME_ROOT="$HOME/.config/theme"
THEMES_DIR="$THEME_ROOT/themes"

if [[ ! -d "$THEMES_DIR/$THEME" ]]; then
  echo "Theme '$THEME' not found in $THEMES_DIR" >&2
  exit 1
fi

LIGHT_THEMES=("catppuccin-latte" "tokyonight-day" "rose-pine-dawn")
for t in "${LIGHT_THEMES[@]}"; do
  if [[ "$t" == "$THEME" ]]; then
    echo "Theme '$THEME' is disabled (dark-only mode)." >&2
    exit 1
  fi
done

MODE="dark"

ln -snf "$THEMES_DIR/$THEME" "$THEME_ROOT/current"
printf '%s\n' "$THEME" > "$THEME_ROOT/name"
printf '%s\n' "$MODE" > "$THEME_ROOT/mode"

if [[ -f "$HOME/.config/alacritty/alacritty.toml" ]]; then
  touch "$HOME/.config/alacritty/alacritty.toml"
fi

if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
  tmux source-file "$THEME_ROOT/current/tmux.conf" >/dev/null 2>&1 || true
fi

if [[ "$OS" == "Darwin" ]]; then
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
fi

# if [[ "$OS" == "Linux" ]]; then
#   gsettings set org.gnome.desktop.interface color-scheme "prefer-$MODE"
# fi
