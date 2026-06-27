return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      'rafamadriz/friendly-snippets',

      {
        'L3MON4D3/LuaSnip',
        version = 'v2.4.0',
        build = 'make install_jsregexp',
        config = function()
          local snippets_path = vim.fn.expand('~/dotfiles/nvim/lua/snippets/')

          require('luasnip.loaders.from_vscode').lazy_load()

          require('luasnip.loaders.from_lua').lazy_load {
            paths = { snippets_path },
          }
        end,
      },
    },
    config = function()
      require('blink.cmp').setup {
        keymap = {
          preset = 'default',
        },

        snippets = {
          preset = 'luasnip',
        },

        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      }
    end,
  },

  {
    'mason-org/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
    end,
  },

  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'mason-org/mason.nvim',
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'saghen/blink.cmp',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      vim.diagnostic.config {
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        float = {
          border = 'rounded',
          source = 'if_many',
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          local map = function(keys, func, desc, mode)
            mode = mode or 'n'

            vim.keymap.set(mode, keys, func, {
              buffer = event.buf,
              desc = 'LSP: ' .. desc,
            })
          end

          local function preview_type_definition()
            if not client then
              vim.notify('No LSP client attached', vim.log.levels.INFO)
              return
            end

            local params = vim.lsp.util.make_position_params(0, client.offset_encoding or 'utf-16')

            client:request('textDocument/typeDefinition', params, function(err, result)
              if err then
                vim.notify('Type definition request failed', vim.log.levels.ERROR)
                return
              end

              if not result or vim.tbl_isempty(result) then
                vim.notify('No type definition found', vim.log.levels.INFO)
                return
              end

              local location = vim.islist(result) and result[1] or result
              local uri = location.uri or location.targetUri
              local range = location.range or location.targetSelectionRange or location.targetRange

              if not uri or not range then
                vim.notify('No type definition location found', vim.log.levels.INFO)
                return
              end

              local target_bufnr = vim.uri_to_bufnr(uri)
              vim.fn.bufload(target_bufnr)

              local start_line = math.max(range.start.line - 2, 0)
              local end_line = range['end'].line + 14

              local line_count = vim.api.nvim_buf_line_count(target_bufnr)
              end_line = math.min(end_line, line_count)

              local lines = vim.api.nvim_buf_get_lines(target_bufnr, start_line, end_line, false)

              if vim.tbl_isempty(lines) then
                vim.notify('No preview lines found', vim.log.levels.INFO)
                return
              end

              local preview_buf = vim.api.nvim_create_buf(false, true)

              vim.api.nvim_buf_set_lines(preview_buf, 0, -1, false, lines)

              local filename = vim.uri_to_fname(uri)
              vim.bo[preview_buf].filetype = vim.filetype.match {
                filename = filename,
                buf = target_bufnr,
              } or vim.bo[target_bufnr].filetype

              vim.bo[preview_buf].modifiable = false
              vim.bo[preview_buf].bufhidden = 'wipe'

              local width = math.floor(vim.o.columns * 0.7)
              local height = math.min(#lines, math.floor(vim.o.lines * 0.5))

              vim.api.nvim_open_win(preview_buf, true, {
                relative = 'cursor',
                row = 1,
                col = 0,
                width = width,
                height = height,
                border = 'rounded',
                style = 'minimal',
              })
            end, event.buf)
          end

          local function format_buffer()
            vim.lsp.buf.format {
              bufnr = event.buf,
              async = true,
            }
          end

          -- Rename symbol under cursor.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Show available code actions.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Jump/navigation.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('grd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gri', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('grr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('grt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

          -- Hover popup, similar to VS Code hover.
          map('K', function()
            vim.lsp.buf.hover {
              border = 'rounded',
            }
          end, 'Hover Documentation')

          -- Function/method parameter popup.
          map('<leader>k', function()
            vim.lsp.buf.signature_help {
              border = 'rounded',
            }
          end, 'Signature Help')

          -- Preview type definition in a floating popup.
          map('<leader>pt', preview_type_definition, '[P]review [T]ype Definition')

          -- Symbols.
          map('gO', vim.lsp.buf.document_symbol, '[G]oto Document Symb[O]ls')
          map('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')

          -- Diagnostics.
          map('<leader>e', function()
            vim.diagnostic.open_float {
              border = 'rounded',
              source = 'if_many',
            }
          end, 'Open Diagnostic Float')

          map('[d', function()
            vim.diagnostic.jump {
              count = -1,
              float = true,
            }
          end, 'Previous Diagnostic')

          map(']d', function()
            vim.diagnostic.jump {
              count = 1,
              float = true,
            }
          end, 'Next Diagnostic')

          -- map('<leader>q', vim.diagnostic.setloclist, 'Diagnostic Location List')

          -- Formatting.
          map('<leader>lf', format_buffer, '[L]SP [F]ormat')

          -- CodeLens: useful for Rust run/debug/reference lenses.
          --
          -- Important:
          -- Do NOT pass both `bufnr` and `client_id` here.
          -- Neovim treats those as mutually exclusive.
          if client and client:supports_method('textDocument/codeLens', event.buf) then
            vim.lsp.codelens.enable(true, {
              bufnr = event.buf,
            })

            map('grx', function()
              vim.lsp.codelens.run()
            end, '[G]oto CodeLens E[x]ecute')
          end

          -- Highlight symbol references under cursor.
          if client and client:supports_method('textDocument/documentHighlight', event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', {
              clear = false,
            })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()

                vim.api.nvim_clear_autocmds {
                  group = 'kickstart-lsp-highlight',
                  buffer = event2.buf,
                }
              end,
            })
          end

          -- Inlay hints.
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            vim.lsp.inlay_hint.enable(true, {
              bufnr = event.buf,
            })

            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled {
                  bufnr = event.buf,
                },
                {
                  bufnr = event.buf,
                }
              )
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      ---@type table<string, vim.lsp.Config>
      local servers = {
        lua_ls = {
          capabilities = capabilities,

          on_init = function(client)
            client.server_capabilities.documentFormattingProvider = false

            if client.workspace_folders then
              local path = client.workspace_folders[1].name

              if path ~= vim.fn.stdpath 'config'
                  and (
                    vim.uv.fs_stat(path .. '/.luarc.json')
                    or vim.uv.fs_stat(path .. '/.luarc.jsonc')
                  ) then
                return
              end
            end

            client.config.settings = client.config.settings or {}
            client.config.settings.Lua = vim.tbl_deep_extend(
              'force',
              client.config.settings.Lua or {},
              {
                runtime = {
                  version = 'LuaJIT',
                  path = { 'lua/?.lua', 'lua/?/init.lua' },
                },

                workspace = {
                  checkThirdParty = false,
                  library = vim.tbl_extend(
                    'force',
                    vim.api.nvim_get_runtime_file('', true),
                    {
                      '${3rd}/luv/library',
                      '${3rd}/busted/library',
                    }
                  ),
                },
              }
            )
          end,

          settings = {
            Lua = {
              hint = {
                enable = true,
              },

              format = {
                enable = false,
              },
            },
          },
        },

        rust_analyzer = {
          capabilities = capabilities,

          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allTargets = true,
                features = 'all',

                buildScripts = {
                  enable = true,
                  rebuildOnSave = true,
                },

                targetDir = true,
              },

              procMacro = {
                enable = true,

                attributes = {
                  enable = true,
                },
              },

              checkOnSave = true,

              check = {
                command = 'clippy',
                allTargets = true,
                features = 'all',
                extraArgs = {
                  '--no-deps',
                },
              },

              completion = {
                autoimport = {
                  enable = true,
                },

                autoself = {
                  enable = true,
                },

                postfix = {
                  enable = true,
                },

                callable = {
                  snippets = 'fill_arguments',
                },

                fullFunctionSignatures = {
                  enable = true,
                },
              },

              imports = {
                granularity = {
                  group = 'module',
                },

                group = {
                  enable = true,
                },

                prefix = 'crate',
              },

              inlayHints = {
                bindingModeHints = {
                  enable = true,
                },

                chainingHints = {
                  enable = true,
                },

                closingBraceHints = {
                  enable = true,
                  minLines = 10,
                },

                closureCaptureHints = {
                  enable = true,
                },

                closureReturnTypeHints = {
                  enable = 'always',
                },

                discriminantHints = {
                  enable = 'always',
                },

                expressionAdjustmentHints = {
                  enable = 'reborrow',
                  mode = 'prefix',
                },

                genericParameterHints = {
                  const = {
                    enable = true,
                  },

                  lifetime = {
                    enable = true,
                  },

                  type = {
                    enable = true,
                  },
                },

                implicitDrops = {
                  enable = true,
                },

                lifetimeElisionHints = {
                  enable = 'skip_trivial',
                  useParameterNames = true,
                },

                maxLength = 80,

                parameterHints = {
                  enable = true,
                },

                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideClosureParameter = false,
                  hideNamedConstructor = false,
                },
              },

              hover = {
                show = {
                  fields = 25,
                  traitAssocItems = 10,
                },
              },

              lens = {
                enable = true,

                run = {
                  enable = true,
                },

                debug = {
                  enable = true,
                },

                implementations = {
                  enable = true,
                },

                references = {
                  adt = {
                    enable = true,
                  },

                  enumVariant = {
                    enable = true,
                  },

                  method = {
                    enable = true,
                  },

                  trait = {
                    enable = true,
                  },
                },
              },

              signatureInfo = {
                detail = 'full',

                documentation = {
                  enable = true,
                },
              },

              diagnostics = {
                enable = true,
              },
            },
          },
        },

        pyright = {
          capabilities = capabilities,
        },

        tailwindcss = {
          capabilities = capabilities,
        },

        ts_ls = {
          capabilities = capabilities,

          init_options = {
            preferences = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = false,
      }

      require('mason-tool-installer').setup {
        ensure_installed = {
          'stylua',
        },
      }

      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
}
