return {
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
    "noahfrederick/vim-hemisu",
    lazy = false,
    priority = 1000,
    config = function ()
    end
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "oxocarbon",
            colorscheme = "oxocarbon"
          },
          {
            name = "hemisu",
            colorscheme = "hemisu"
          },
        }
      })
    end
  },
  {
    "xiyaowong/transparent.nvim"
  }
}
