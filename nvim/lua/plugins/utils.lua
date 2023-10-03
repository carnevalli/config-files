-- Indent BlankLine
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
}

-- Colorizer
require'colorizer'.setup()

-- Autopairs
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})
