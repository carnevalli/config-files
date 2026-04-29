#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

print_step() { printf "\n==> %s\n" "$1"; }
print_ok()   { printf "    \xe2\x9c\x93 %s\n" "$1"; }
print_skip() { printf "    - %s\n" "$1"; }

check_source() {
  if [ ! -e "$1" ]; then
    printf "    ERROR: %s not found. Run this script from the repo root.\n" "$1" >&2
    exit 1
  fi
}

update_nvim() {
  local src="$REPO_DIR/nvim"
  local dest="$HOME/.config/nvim"

  print_step "Installing nvim config"
  check_source "$src"

  if [ -e "$dest" ]; then
    rm -rf "$dest"
    print_ok "Removed existing $dest"
  fi

  cp -r "$src" "$dest"
  print_ok "Copied $src -> $dest"
}

update_vim() {
  local src="$REPO_DIR/vim-gtk3/.vimrc"
  local dest="$HOME/.vimrc"

  print_step "Installing vim-gtk3 config"
  check_source "$src"

  rm -f "$dest"
  cp "$src" "$dest"
  print_ok "Copied $src -> $dest"
}

update_tmux() {
  local src="$REPO_DIR/tmux/tmux.conf"

  print_step "Installing tmux config"
  check_source "$src"

  local tmux_version_raw
  tmux_version_raw="$(tmux -V 2>/dev/null | sed 's/tmux //' || true)"

  if [ -z "$tmux_version_raw" ]; then
    local dest_dir="$HOME/.config/tmux"
    local dest="$dest_dir/tmux.conf"
    mkdir -p "$dest_dir"
    rm -f "$HOME/.tmux.conf" 2>/dev/null || true
    rm -f "$dest"
    cp "$src" "$dest"
    print_ok "Copied $src -> $dest (tmux not detected; using XDG path)"
    print_skip "Cleaned up legacy ~/.tmux.conf"
    return
  fi

  local tmux_major tmux_minor
  tmux_major="$(echo "$tmux_version_raw" | cut -d. -f1)"
  tmux_minor="$(echo "$tmux_version_raw" | cut -d. -f2 | sed 's/[^0-9].*//')"

  if [ "$tmux_major" -gt 3 ] || { [ "$tmux_major" -eq 3 ] && [ "$tmux_minor" -ge 2 ]; }; then
    local dest_dir="$HOME/.config/tmux"
    local dest="$dest_dir/tmux.conf"
    mkdir -p "$dest_dir"
    rm -f "$HOME/.tmux.conf" 2>/dev/null || true
    rm -f "$dest"
    cp "$src" "$dest"
    print_ok "Copied $src -> $dest (tmux $tmux_version_raw >= 3.2, XDG path)"
    print_skip "Cleaned up legacy ~/.tmux.conf"
  else
    local dest="$HOME/.tmux.conf"
    rm -f "$dest"
    cp "$src" "$dest"
    print_ok "Copied $src -> $dest (tmux $tmux_version_raw < 3.2, legacy path)"
  fi
}

update_i3() {
  local src="$REPO_DIR/i3wm/config"
  local dest_dir="$HOME/.config/i3"
  local dest="$dest_dir/config"

  print_step "Installing i3wm config"
  check_source "$src"

  mkdir -p "$dest_dir"
  rm -f "$dest"
  cp "$src" "$dest"
  print_ok "Copied $src -> $dest"
}

update_i3status() {
  local src="$REPO_DIR/i3status/config"
  local dest_dir="$HOME/.config/i3status"
  local dest="$dest_dir/config"

  print_step "Installing i3status config"
  check_source "$src"

  mkdir -p "$dest_dir"
  rm -f "$dest"
  cp "$src" "$dest"
  print_ok "Copied $src -> $dest"
}

update_all() {
  update_nvim
  update_vim
  update_tmux
  update_i3
  update_i3status
  printf "\n=== All configs installed ===\n"
}

usage() {
  cat <<EOF
Usage: $(basename "$0") <target>

Targets:
  nvim       Install/update nvim config      ~/.config/nvim/
  vim        Install/update vim-gtk3 config  ~/.vimrc
  tmux       Install/update tmux config      ~/.config/tmux/tmux.conf (or ~/.tmux.conf for tmux < 3.2)
  i3         Install/update i3wm config      ~/.config/i3/config
  i3status   Install/update i3status config  ~/.config/i3status/config
  all        Install/update all configs
EOF
  exit 1
}

case "${1:-}" in
  nvim)     update_nvim ;;
  vim)      update_vim ;;
  tmux)     update_tmux ;;
  i3)       update_i3 ;;
  i3status) update_i3status ;;
  all)      update_all ;;
  *)        usage ;;
esac
