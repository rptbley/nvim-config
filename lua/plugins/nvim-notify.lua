local M = {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			render = "wrapped-compact",
			stages = "fade",
		})
	end,
}

return M
