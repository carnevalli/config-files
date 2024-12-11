require("thad.conf.settings")

require("thad.conf.telescope")
require("thad.conf.treesitter")
require("thad.conf.undotree")
require("thad.conf.cmp")
require("thad.conf.indent_blankline")

require('java').setup()
require('lspconfig').jdtls.setup({})
