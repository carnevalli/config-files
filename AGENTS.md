# AGENTS.md

## Repo purpose

Dotfiles for i3wm, tmux, vim (gtk3), and nvim. No build system, no tests, no CI.

## Directory layout

```
i3wm/config          — i3 window manager config
i3status/config      — i3status bar config
i3-debian-install/   — apt install script for i3 dependencies
tmux/tmux.conf       — tmux config (canonical; tmux/.tmux.conf is the old deleted version)
vim-gtk3/.vimrc      — vim config (canonical; vim/.vimrc is the old deleted version)
nvim/init.lua        — nvim entrypoint (vim-plug, settings, keymaps)
nvim/lua/conf/       — one file per plugin config
```

The old `vim/.vimrc`, `tmux/.tmux.conf`, `nvim/init.vim`, `nvim/lua/thad/`, `nvim/lua/config/`, and `nvim/lua/plugins/` are deleted but not yet committed — do not restore or reference them.

## Plugin manager

nvim uses **vim-plug** (not lazy.nvim). Plugins are declared in `nvim/init.lua` between `vim.call('plug#begin')` and `vim.call('plug#end')`. Each plugin gets its own config file under `nvim/lua/conf/` and is `require`d at the bottom of `init.lua`.

## Shortcut conventions (keep consistent across tools)

- **Leader**: `<Space>` in both vim and nvim.
- **hjkl navigation**: used at every layer — i3 (`$mod+hjkl`), tmux (`prefix+hjkl`), vim/nvim (`<C-hjkl>` for splits).
- **`<leader>w`**: save file — defined in both vim and nvim.
- **colorcolumn**: col 80 in vim (`colorcolumn=80`); col 80 and 120 in nvim (`virt-column` with `virtcolumn = "80,120"`).

When adding or changing keymaps in nvim, also update `nvim/lua/conf/which-key.lua` to document them.

## Known gaps (not yet fixed)

- nvim does not set `updatetime` (vim uses 300). Affects gitsigns and LSP CursorHold responsiveness.
- nvim does not explicitly set `mouse=a` (vim does). Modern nvim defaults cover this but it's not explicit.
- `<A-j/k>` line-move bindings exist in vim but not nvim.
