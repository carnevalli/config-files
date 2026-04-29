set nocompatible

" Leader key
let mapleader = " "

set backspace=2
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set hlsearch
set history=1000
set wildmenu
set scrolloff=8
set sidescrolloff=8
set splitbelow
set splitright
set cursorline
set laststatus=2
set ruler
set colorcolumn=80
set signcolumn=yes
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo
set updatetime=300
set clipboard=unnamedplus
set mouse=a

filetype on
filetype plugin on
filetype indent on

syntax on
colorscheme wildcharm

" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" Save with leader+w
nnoremap <leader>w :w<CR>

" Navigate splits with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up/down with Alt+j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
