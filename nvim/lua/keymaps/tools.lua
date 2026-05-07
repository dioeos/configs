local M = {}
function M.setup()
  -- ==========
  -- OIL
  -- ==========
  vim.keymap.set("n", "-", "<CMD>Oil<CR>")

  -- ==========
  -- FLASH
  -- ==========
  local flash = require("flash")
  vim.keymap.set({ "n", "x", "o" }, "ff", flash.jump, { desc = "Flash" })
  vim.keymap.set({ "n", "x", "o" }, "<leader>S", flash.treesitter, { desc = "Flash Treesitter" })
  vim.keymap.set("o", "r", flash.remote, { desc = "Remote Flash" })
  vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
  vim.keymap.set("c", "<C-s>", flash.toggle, { desc = "Toggle Flash Search" })
end
return M
