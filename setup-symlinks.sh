#!/bin/sh
# Symlink config directories to this repo, one per line.
# Works on Linux and macOS: clone the repo, then run this script.
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}"

apps() {
  echo "nvim"
  echo "ghostty"
  echo "btop"
  echo "opencode"
}

for app in $(apps); do
  SRC="$SCRIPT_DIR/$app"
  DST="$CONFIG_ROOT/$app"

  if [ ! -d "$SRC" ]; then
    echo "error: $SRC not found" >&2
    continue
  fi

  if [ -L "$DST" ]; then
    current="$(readlink "$DST")"
    if [ "$current" = "$SRC" ]; then
      echo "ok: $DST already points to $SRC"
      continue
    fi
    echo "error: $DST already links to $current - pointing elsewhere on purpose?" >&2
    continue
  fi

  if [ -e "$DST" ]; then
    backup="$DST.bak.$(date +%Y%m%d%H%M%S)"
    mv "$DST" "$backup"
    echo "backed up $DST to $backup"
  fi

  mkdir -p "$CONFIG_ROOT"
  ln -s "$SRC" "$DST"
  echo "done: $DST -> $SRC"
done
