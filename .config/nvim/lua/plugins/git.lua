return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      config = function(bufnr, opts)
        require("core.utils").load_mappings(require("core.mappings").gitsigns, { buffer = bufnr })
        require("gitsigns").setup(opts)
      end,
    },
  },
}
