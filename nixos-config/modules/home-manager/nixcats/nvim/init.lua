require("config.options")
require("config.keymaps")

require("config.plugins.themery")
require("config.plugins.oil")
require("config.plugins.telescope")
require("config.plugins.flash")
require("config.plugins.obsidian")
require("config.plugins.harpoon")
require("config.plugins.completion")

require("config.lsp.attach-lsp")
require("config.lsp.diagnostics")

-- === LSP SERVERS === --
require("config.lsp.lua-lsp")
require("config.lsp.typescript-lsp")
require("config.lsp.nix-lsp")
require("config.lsp.qml-lsp")
require("config.lsp.rust-lsp")
-- require("config.lsp.ruby-lsp")
