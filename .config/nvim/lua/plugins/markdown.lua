return {
  {
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
