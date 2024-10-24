local treesitter = {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "User FilePost",
    opts = {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "c", "lua", "vim", "python", "markdown", "markdown_inline", "latex" },

      highlight = { enable = true },
      indent = { enable = true },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      vim.cmd("TSEnable highlight")
    end,
  },
}

return treesitter
