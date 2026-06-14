#!/usr/bin/env bash

SHELL_CONFIG_FILE="$HOME/dotfiles/config.json"
REQ_WALL_PATH=""

if [ ! "$1" ]; then
  echo "Please provide wallpaper path"
fi

REQ_WALL_PATH="$1"

if [ -f "$SHELL_CONFIG_FILE" ]; then
  if command -v jq >/dev/null 2>&1; then
    echo "Changing wallpaper..."
    jq --arg path "${REQ_WALL_PATH}" '.background.wallpaperPath = $path' \
      "$SHELL_CONFIG_FILE" > "$SHELL_CONFIG_FILE.tmp" \
      && mv "$SHELL_CONFIG_FILE.tmp" "$SHELL_CONFIG_FILE"
  fi
fi
