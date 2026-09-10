require("lze").load({
  {
    "marks.nvim",
    for_cat = "tools",
    opts = {},
    after= function()
      require("marks").setup({})
    end
  },
})
