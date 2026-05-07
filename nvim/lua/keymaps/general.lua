local M = {}
function M.setup()
  vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")
  vim.keymap.set("n", "<leader>wq", ":wq<CR>")
  vim.keymap.set("n", "<leader>q", ":q<CR>")
end
return M
