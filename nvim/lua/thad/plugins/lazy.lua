return {
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

    { "itchyny/lightline.vim", name = "lightline" },

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"windwp/nvim-ts-autotag"}},

    { "nvim-treesitter/nvim-treesitter-context" },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'lukas-reineke/virt-column.nvim' },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    { 'mbbill/undotree' },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
	    "nvim-tree/nvim-tree.lua",
	    version = "*",
	    lazy = false,
	    dependencies = {
		    "nvim-tree/nvim-web-devicons",
	    },
	    config = function()
		    require("nvim-tree").setup {}
	    end,
    }, 

    
      {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v2.x',
        lazy = true,
        config = function()
          -- This is where you modify the settings for lsp-zero
          -- Note: autocompletion settings will not take effect

          require('lsp-zero.settings').preset({})
        end
      },


      {
          "L3MON4D3/LuaSnip",
          -- follow latest release.
          version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
          -- install jsregexp (optional!).
          build = "make install_jsregexp"
      },

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
          {'L3MON4D3/LuaSnip'},
        },
      },

--      -- LSP
--      {
--        'neovim/nvim-lspconfig',
--        cmd = 'LspInfo',
--        event = {'BufReadPre', 'BufNewFile'},
--        dependencies = {
--          {'hrsh7th/cmp-nvim-lsp'},
--          {'williamboman/mason-lspconfig.nvim'},
--          {'williamboman/mason.nvim'},
--        },
--        config = function()
--          -- This is where all the LSP shenanigans will live
--
--          local lsp = require('lsp-zero')
--
--          lsp.on_attach(function(client, bufnr)
--            -- see :help lsp-zero-keybindings
--            -- to learn the available actions
--            lsp.default_keymaps({buffer = bufnr})
--          end)
--
--          -- (Optional) Configure lua language server for neovim
--          require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
--          lsp.setup()
--        end
--      
--    },
    {
      'nvim-java/nvim-java',
      dependencies = {
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-refactor',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-test',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        'neovim/nvim-lspconfig',
        'mfussenegger/nvim-dap',
        {
          'williamboman/mason.nvim',
          opts = {
            registries = {
              'github:nvim-java/mason-registry',
              'github:mason-org/mason-registry',
            },
          },
        }
      },
    },
}
