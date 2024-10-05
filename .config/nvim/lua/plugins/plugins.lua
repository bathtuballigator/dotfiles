-- this is a comment
local plugins = {
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000, event = "VeryLazy",
    config = function()
      require("catppuccin").setup({
        -- optional setup goes here
        integrations = {
          nvimtree = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {},
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },
}

return plugins
