local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    -- "--compile-commands-dir=/home/rose/geekos/build"
  },
  filetypes = {"c"},
  on_attach = on_attach,
  capabilities = capabilities,
}
