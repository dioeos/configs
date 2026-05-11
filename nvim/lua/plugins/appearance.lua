return {
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "crimson moonlight",
            colorscheme = "crimson_moonlight"
          },
          {
            name = "oxocarbon",
            colorscheme = "oxocarbon"
          },
          {
            name = "venom",
            colorscheme = "venom"
          }
        }
      })
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({
        stiffness = 0.8,
        trailing_stiffness = 0.6,
        stiffness_insert_mode = 0.7,
        damping = 0.95,
        damping_insert_mode = 0.95,
        distance_stop_animating = 0.5,
      })
    end
  },
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,

    config = function()
      require("black-metal").setup({
      })

      require("black-metal").load()
    end,
  },
  {
    "rockerBOO/boo-colorscheme-nvim",
    config = function()
      require("boo-colorscheme").use{
        italic = true
      }
    end
  }
}
