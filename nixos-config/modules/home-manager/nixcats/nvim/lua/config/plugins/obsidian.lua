require("lze").load({
  {
    "obsidian.nvim",
    for_cat = "notes",
    ft = "markdown",

    keys = {
      {
        "<leader>ot",

        function()
          local templates = {
            "coding-notes"
          }

          vim.ui.select(templates, {
          }, function(template)
            if not template then
              return
            end

            local title = vim.fn.input("Title: ")
            if title == nil or title == "" then
              return
            end

            vim.cmd(
              "Obsidian new_from_template "
                .. vim.fn.fnameescape(title)
                .. " "
                .. vim.fn.fnameescape(template)
            )
        end)
      end,
      desc = "Obsidian new note from template",

      },
      {
        "<leader>on",
        function()
          vim.cmd("Obsidian new")
        end,
        desc = "Obsidian new note",
      },
    },

    after = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "merle-vault",
            path = "~/merle-vault",
          },
        },
        picker = {
          name = "telescope.nvim"
        },
        notes_subdir = "Raw",
        new_notes_location = "Raw",

        templates = {
          folder = "Housekeeping/Templates",
        },
        frontmatter = {
          func = function(note)
            if note.title then
              note:add_alias(note.title)
            end

            local out = {
              id = note.id,
              aliases = note.aliases,
              tags = note.tags,
              created = os.date("%Y-%m-%d"),
              summary = ""
            }

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
              for k, v in pairs(note.metadata) do
                out[k] = v
              end
            end

            return out
          end
        },

        legacy_commands = false,

        note_id_func = function(title)
          if title ~= nil then
            return title
              :lower()
              :gsub("%s+", "-")
              :gsub("[^%w%-]", "")
              :gsub("%-+", "-")
              :gsub("^%-", "")
              :gsub("%-$", "")
          end
          return tostring(os.time())
        end,
      })
    end
  }
})
