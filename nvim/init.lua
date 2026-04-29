-- Bootstrap vim-plug if not installed
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.filereadable(plug_path) == 0 then
  vim.fn.system({
    'curl', '-fLo', plug_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('bluz71/vim-moonfly-colors', { as = 'moonfly' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-context')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('windwp/nvim-autopairs')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })
Plug('lukas-reineke/virt-column.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('mbbill/undotree')
Plug('kylechui/nvim-surround', { tag = '*' })
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('L3MON4D3/LuaSnip', { tag = 'v2.*', ['do'] = 'make install_jsregexp' })
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('saadparwaiz1/cmp_luasnip')
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v4.x' })
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('lewis6991/gitsigns.nvim')
Plug('folke/which-key.nvim')

vim.call('plug#end')

-- General settings
vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.splitright = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

local undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.cmd("colorscheme moonfly")

-- Keymaps
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Navigate splits with Ctrl+hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

-- Lualine (statusline)
require("conf/lualine")

-- Plugin configs
require("conf/nvim-treesitter")
require("conf/nvim-treesitter-context")
require("nvim-autopairs").setup{}
require("conf/lsp-zero")
require("conf/cmp")
require("conf/mason")
require("conf/nvim-surround")
require("conf/virt-column")
require("conf/indent-blankline")
require("conf/nvim-tree")
require("conf/nvim-web-devicons")
require("conf/telescope")
require("conf/gitsigns")
require("conf/which-key")
