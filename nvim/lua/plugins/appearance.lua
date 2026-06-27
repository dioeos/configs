return {
  {
    "T-b-t-nchos/Aquavium.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("Aquavium").setup({
        italic = true,
        transparent = false,
      })
    end,
  },
  {
    "noahfrederick/vim-hemisu",
    lazy = true,
  },

  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local lackluster = require("lackluster")
      local highlights = require("config.lackluster")

      lackluster.setup({
        disable_plugin = {},
        tweak_background = {
          normal = "#0d0b03"
        },
        tweak_pallet = {},
        tweak_syntax = {},
        tweak_ui = {},
        tweak_highlight = highlights,
      })
    end,
  },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "aquavium",
            colorscheme = "Aquavium",
          },
          {
            name = "hemisu",
            colorscheme = "hemisu",
          },
          {
            name = "lackluster",
            colorscheme = "lackluster",
          },
        },
      })
    end,
  },

  {
    "xiyaowong/transparent.nvim",
  },
}
