return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.completion.spell,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
  end,
}
