-- this is a comment
local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "VeryLazy",
    dependencies = { "catppuccin", "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {}
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = { theme = "catppuccin", },
    }
  },
}

return plugins
