require('lualine').setup({
  options = {
    theme = 'moonfly',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '' },
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
      { 'diagnostics', sources = { 'nvim_lsp' } },
    },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
