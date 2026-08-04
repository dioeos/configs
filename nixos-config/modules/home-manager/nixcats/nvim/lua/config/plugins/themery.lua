require("lze").load({
  {
    "themery.nvim",
    for_cat = "tools",
    keys = {
      {
        "<leader>st",
        "<cmd>Themery<CR>",
        desc = "Open themery",
      },
    },
    after = function()
      require("themery").setup({
        themes = {
          {
            name = "kanagawa",
            colorscheme = "kanagawa"
          },
          {
            name = "merle",
            colorscheme = "merle"
          },
          {
            name = "ashen",
            colorscheme = "ashen"
          },
          {
            name = "vesper",
            colorscheme = "vesper"
          },
          {
            name = "nvimgelion",
            colorscheme = "nvimgelion"
          }
        }
      })
    end
  }
})
