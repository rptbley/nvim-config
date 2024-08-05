local M = {
  "nvim-telescope/telescope.nvim",
  build = 'make',
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope-fzf-native.nvim' },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top'
        },
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
          n = {
            ["q"] = actions.close,
            ["o"] = actions.select_default,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      }
    })

    telescope.load_extension('fzf')
  end,
}

return { M }
