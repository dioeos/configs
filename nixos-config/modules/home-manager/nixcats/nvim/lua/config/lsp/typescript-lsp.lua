vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },

  filetypes = {
    "typescript",
    "typescriptreact",
  },

  root_markers = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
  }
})

vim.lsp.enable("ts_ls")
