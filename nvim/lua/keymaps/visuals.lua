local M = {}
function M.setup()
  vim.keymap.set("n", "<leader>st", ":Themery<CR>")

  vim.keymap.set("n", "<leader>te", ":TransparentToggle<CR>")

end
return M
