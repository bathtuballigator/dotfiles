return {
  {
    {
      "ryleelyman/latex.nvim",
      opts = {},
    },
    {
      "epwalsh/obsidian.nvim",
      version = "*", -- recommended, use latest release instead of latest commit
      lazy = true,
      cmd = { "ObsidianWorkspace", "ObsidianDailies", "ObsidianNew", "ObsidianSearch", "ObsidianQuickSwitch" },
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
      opts = {
        latex = { enabled = false },
        win_options = { conceallevel = { rendered = 2 } },
        bullet = {
          right_pad = 1,
        },
        checkbox = {
          -- Turn on / off checkbox state rendering
          enabled = true,
          -- Determines how icons fill the available space:
          --  inline:  underlying text is concealed resulting in a left aligned icon
          --  overlay: result is left padded with spaces to hide any additional text
          position = "inline",
          unchecked = {
            -- Replaces '[ ]' of 'task_list_marker_unchecked'
            icon = "󰄱",
            -- Highlight for the unchecked icon
            highlight = "RenderMarkdownUnchecked",
            -- Highlight for item associated with unchecked checkbox
            scope_highlight = nil,
          },
          checked = {
            -- Replaces '[x]' of 'task_list_marker_checked'
            icon = "",
            -- Highligh for the checked icon
            highlight = "RenderMarkdownChecked",
            -- Highlight for item associated with checked checkbox
            scope_highlight = nil,
          },
          -- Define custom checkbox states, more involved as they are not part of the markdown grammar
          -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
          -- Can specify as many additional states as you like following the 'todo' pattern below
          --   The key in this case 'todo' is for healthcheck and to allow users to change its values
          --   'raw':       Matched against the raw text of a 'shortcut_link'
          --   'rendered':  Replaces the 'raw' value when rendering
          --   'highlight': Highlight for the 'rendered' icon
          custom = {
            todo = { raw = "[-]", rendered = "󰥔", highlight = "RenderMarkdownTodo" },
            right_arrow = { raw = "[>]", rendered = "", highlight = "ObsidianRightArrow" },
            tilde = { raw = "[~]", rendered = "󰰱", highlight = "ObsidianTilde" },
            exclamation = { raw = "[!]", rendered = "", highlight = "ObsidianImportant" },
          },
        },
      },
    },
    -- {
    --   "OXY2DEV/markview.nvim",
    --   lazy = false, -- Recommended
    --   -- ft = "markdown" -- If you decide to lazy-load anyway
    --
    --   dependencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-tree/nvim-web-devicons",
    --   },
    -- },
    {
      "tadmccorkle/markdown.nvim",
      ft = "markdown", -- or 'event = "VeryLazy"'
      opts = {
        -- configuration here or empty for defaults
      },
    },

    --   {
    --     "davidgranstrom/nvim-markdown-preview",
    --     config = function ()
    --
    --     end
    -- }
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
        -- vim.g.mkdp_auto_start = 1
        vim.g.mkdp_browser = "librewolf"
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
