require('gitsigns').setup({
  signs = {
    add          = { text = '▎' },
    change       = { text = '▎' },
    delete       = { text = '▁' },
    topdelete    = { text = '▔' },
    changedelete = { text = '▎' },
    untracked    = { text = '▎' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local opts = { buffer = bufnr }

    -- Navigation
    vim.keymap.set('n', ']h', gs.next_hunk, opts)
    vim.keymap.set('n', '[h', gs.prev_hunk, opts)

    -- Staging
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, opts)
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, opts)
    vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, opts)
    vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, opts)
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, opts)
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, opts)
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, opts)

    -- Preview / blame
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, opts)
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line({ full = true }) end, opts)
    vim.keymap.set('n', '<leader>hd', gs.diffthis, opts)

    -- Text object: select hunk with ih
    vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
  end
})
