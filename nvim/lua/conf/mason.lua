require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {"bashls", "cssls", "dockerls", "gopls", "html", "tsserver", "jsonls", "intelephense", "pyright", "sqlls"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
