return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      -- optional setup goes here
      transparent_background = vim.g.transparent_enabled,
      integrations = {
        gitsigns = true,
        neotree = false,
        markdown = true,
        treesitter = true,
        mini = {
          enabled = true,
          indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        telescope = {
          enabled = true,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        mason = false,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
