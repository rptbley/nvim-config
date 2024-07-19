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
						["o"] = actions.select_default,
					},
				},
			},
			pickers = {
				find_files = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = { theme = "dropdown" },
				oldfiles = { theme = "dropdown" },
			},
		})
	end,
}

return { M }
