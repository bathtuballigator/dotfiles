-- this is a comment
local plugins = {
  {
    "RaafatTurki/hex.nvim",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    lazy = false,
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
    "jvgrootveld/telescope-zoxide",
  },
  {
    "nmac427/guess-indent.nvim",
    opts = {
      -- can put config here
    },
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VeryLazy",
  --   opts = {},
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    opts = {
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "catppuccin", "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        always_show_bufferline = false,
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  },
  {
    "famiu/bufdelete.nvim",
    event = "BufNew",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = "User FilePost",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "catppuccin-mocha" },
    },
    config = function(_, opts)
      local auto = require("lualine.themes.auto")
      local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
      for _, field in ipairs(lualine_modes) do
        if auto[field] and auto[field].c then
          auto[field].c.bg = "NONE"
        end
      end
      opts.options.theme = auto
      require("lualine").setup(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      exclude = {
        filetypes = {
          "dashboard",
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "nvdash",
          "nvcheatsheet",
          "",
        },
      },
      -- show_trailing_blankline_indent = false,
      -- show_first_indent_level = false,
      -- show_current_context = true,
      -- show_current_context_start = true,
    },
  },
}

return plugins
