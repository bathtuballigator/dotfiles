return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.operators").setup()
      require("mini.notify").setup()
      require("mini.jump2d").setup()
      require("mini.icons").setup()
      require("mini.align").setup()
    end,
  },
}
