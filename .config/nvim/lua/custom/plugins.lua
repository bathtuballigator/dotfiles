local plugins = {
  {
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
          theme = 'hyper',
          config = {
            week_header = {
             enable = true,
            },
            shortcut = {
              { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
              {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
              },
              {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a',
              },
              {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
              },
            },
          },
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
      "nanotee/zoxide.vim"
    },
    {
      "jvgrootveld/telescope-zoxide"
    },
    {
      "nvim-lua/popup.nvim"
    },
    {
      "nvim-lua/plenary.nvim"
    },
    {
      "nmac427/guess-indent.nvim",
      init = function() require("guess-indent").setup ({
        -- can put config here
      }) end
    },
    -- {
    --   "junegunn/fzf.vim",
    --   dir = "~/.fzf",
    --   build = "./install --all",
    --   depedencies = {
    --     "junegunn/fzf"
    --   },
    --   lazy=false
    -- },
    {
      lazy=false,
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
          "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function ()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },
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
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
         "clangd",
         "lua-language-server"
        }
      }
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  }
}

return plugins
