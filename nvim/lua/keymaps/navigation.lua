local M = {}
function M.setup()
  -- ==========
  -- DEFAULT
  -- ==========
  vim.keymap.set("n", "H", "<C-w>h", { noremap = true, silent = true })
  vim.keymap.set("n", "J", "<C-w>j", { noremap = true, silent = true })
  vim.keymap.set("n", "K", "<C-w>k", { noremap = true, silent = true })
  vim.keymap.set("n", "L", "<C-w>l", { noremap = true, silent = true })
end
return M
