local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
  },
  filetypes = {"c", "cpp"},
})

require("core.utils").load_mappings(require("core.mappings").lspconfig, {})
