return {
  "catppuccin/nvim", name = "catppuccin", priority = 1000, event = "VeryLazy",
  config = function()
    require("catppuccin").setup({
      -- optional setup goes here
      integrations = {
        nvimtree = true,
        treesitter = true,
        telescope = {
          enabled = true,
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
