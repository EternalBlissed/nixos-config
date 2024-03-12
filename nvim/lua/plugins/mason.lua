return {
  require("mason").setup(),
  require("mason-lspconfig").setup({
      -- Optionally configure automatic installation of LSP servers, formatters, linters, etc.
      automatic_installation = true,
  })
}
