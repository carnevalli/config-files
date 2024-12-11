call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'projekt0n/github-nvim-theme'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'lukas-reineke/virt-column.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mbbill/undotree'
Plug 'kylechui/nvim-surround', { 'tag': '*' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

" Vim Settings
set guicursor=""
let mapleader="\<space>"


set nu
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

set noswapfile
set nobackup
set undodir=os.getenv("HOME") .. "/.vim/undodir"
set undofile

set hlsearch
set incsearch

set termguicolors

set clipboard="unnamedplus"
colorscheme moonfly

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <F5> :UndotreeToggle<CR>


let g:lightline = {
            \ 'colorscheme': 'moonfly',
            \ }

" lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
lua << EOF
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
EOF
