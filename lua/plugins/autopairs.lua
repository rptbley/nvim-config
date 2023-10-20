local autopairs = {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end,
}

local autotags = {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}

return { autopairs, autotags }
