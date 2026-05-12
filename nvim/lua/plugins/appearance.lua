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
}
