return {
  {
    {
      "epwalsh/obsidian.nvim",
      version = "*", -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
      -- event = {
      --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      --   -- refer to `:h file-pattern` for more examples
      --   "BufReadPre path/to/my-vault/*.md",
      --   "BufNewFile path/to/my-vault/*.md",
      -- },
      dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
      },
      opts = function()
        return require("config.obsidian")
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
    },
    {
      "OXY2DEV/markview.nvim",
      lazy = false, -- Recommended
      -- ft = "markdown" -- If you decide to lazy-load anyway

      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
    },
    {
      "tadmccorkle/markdown.nvim",
      ft = "markdown", -- or 'event = "VeryLazy"'
      opts = {
        -- configuration here or empty for defaults
      },
    },
    -- Install markdown preview, use npx if available.
    {

      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function(plugin)
        if vim.fn.executable("npx") then
          vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
        else
          vim.cmd([[Lazy load markdown-preview.nvim]])
          vim.fn["mkdp#util#install"]()
        end
      end,
      init = function()
        if vim.fn.executable("npx") then
          vim.g.mkdp_filetypes = { "markdown" }
        end
      end,
    },
  },
  {
    "aspeddro/pandoc.nvim",
    opts = {},
  },
  -- {
  --   "davidgranstrom/nvim-markdown-preview",
  -- },
}
