local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({})
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
  },
  filetypes = { "c", "cpp" },
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.texlab.setup({
  capabilities = capabilities,
  filetypes = { "tex", "plaintex", "bib" },
})

lspconfig.marksman.setup({})
require("core.utils").load_mappings(require("core.mappings").lspconfig, {})
