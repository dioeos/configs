local lsp_group = vim.api.nvim_create_augroup("merle.lsp", { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,

  callback = function(ev)
    local bufnr = ev.buf
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        silent = true,
        desc = desc,
      })
    end

    map("n", "<leader>hh", vim.lsp.buf.hover, "LSP hover")
    map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")

    if client:supports_method("textDocument/formatting") then
      map("n", "<leader>fd", function()
        print("Formatting with " .. client.name)

        vim.lsp.buf.format({
          bufnr = bufnr,
        })
      end, "Format buffer")
    end
  end
})
