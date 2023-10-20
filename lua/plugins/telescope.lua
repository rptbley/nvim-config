local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
        buffers = { theme = "dropdown" },
        git_commits = { theme = "ivy" },
        git_branches = { theme = "ivy" },
      },
    })
  end,
}

return { M }
