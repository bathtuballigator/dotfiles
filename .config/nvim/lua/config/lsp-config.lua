local lspconfig = vim.lsp.config
local lspenable = vim.lsp.enable
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["lua_ls"] = {}
lspenable("lua_ls")
lspconfig["clangd"] = {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
  },
  filetypes = { "c", "cpp" },
}
lspenable("clangd")

lspconfig["pyright"] = {
  capabilities = capabilities,
  filetypes = { "python" },
}
lspenable("pyright")

lspconfig["texlab"] = {
  capabilities = capabilities,
  filetypes = { "tex", "plaintex", "bib" },
}
lspenable("texlab")

lspconfig["marksman"] = {}
lspenable("marksman")

require("core.utils").load_mappings(require("core.mappings").lspconfig, {})
