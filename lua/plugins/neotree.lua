local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	config = function()
		require("neo-tree").setup({
			source_selector = {
				winbar = true,
			},
			window = {
				mappings = {
					["o"] = "open",
					["<Tab>"] = "next_source",
				},
			},
		})
	end,
}

return { M }
