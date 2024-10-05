return {
  {
    "williamboman/mason.nvim",    
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    event = "VeryLazy",
    opts = {
      -- options for setup here
      ensure_installed = {"clangd", "pyright", "lua-language-server", "clang-format", "mypy"},
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lsp-config"
    end
  },
}
