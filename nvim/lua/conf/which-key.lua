local wk = require('which-key')

wk.setup({
  delay = 300,
})

-- Document key groups so which-key shows clean labels
wk.add({
  { '<leader>f', group = 'find (telescope)' },
  { '<leader>h', group = 'git hunks' },
  { '<leader>w', desc = 'save file' },
  { '<leader>e', desc = 'file explorer' },
  { '<leader>d', desc = 'diagnostics float' },
  { ']d',        desc = 'next diagnostic' },
  { '[d',        desc = 'prev diagnostic' },
  { ']h',        desc = 'next git hunk' },
  { '[h',        desc = 'prev git hunk' },
  { '<F2>',      desc = 'LSP rename' },
  { '<F3>',      desc = 'LSP format' },
  { '<F4>',      desc = 'LSP code action' },
  { '<F5>',      desc = 'undo tree' },
})
