local xeno = require("xeno")

xeno.color("dirtyred", "#810C14")
xeno.color("blue", "#0000ff")

xeno.color('mist', '#a8c4bb')
xeno.color('dew', '#9fc4d6')
xeno.color('meadow', '#7fa876')
xeno.color('moss', '#6b9160')
xeno.color('lichen', '#b8c47a')
xeno.color('straw', '#d9c17a')
xeno.color('sun', '#e8d48a')
xeno.color('frost', '#c0d8dc')
xeno.color('fog', '#b8c4b0')

xeno.setup({
  background = '#25262B',
  accent = '#8fae7a',
  foreground = '#d8ddd0',
  -- properties = { contrast = -0.15, chroma = -0.15, lightness = 0.10, variation = 0.05 },

  integrations = {
    ghostty = {
      enabled = false
    }
  },

  highlights = {
    editor = {
      Normal = { bg = '#25262B' },
      NormalNC = { bg = '#25262B' },
      Visual = { bg = xeno.opaque('@background.500', 0.18) }


      -- CursorLineNr = { fg = '@sun.100', bold = true },
      -- MatchParen = { fg = '@sun.100', bold = true },
      -- Visual = { bg = xeno.opaque('@dirtyred.400', 0.18) },
      -- CursorLine = { bg = xeno.opaque('@background.500', 0.06) },
      -- Search = { bg = xeno.opaque('@straw.300', 0.30), fg = '@background.950' },
    },
    syntax = {
      Comment = { fg = "@blue.400", italic = true },
      Type = { fg = "@dirtyred.200", italic = true },
      ["@type"] = { link = "Type" },
    },
  },

  plugins = {
    ["nvim-telescope/telescope.nvim"] = {
      bg = '#25262B',
      border = '#25262B'
    }
  }
})
