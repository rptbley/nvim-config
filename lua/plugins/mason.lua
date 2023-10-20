local mason = {
	"williamboman/mason.nvim",
	enabled = true,
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end,
}

local masonLspconfig = {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "lua_ls", "jsonls", "html", "cssls", "cssmodules_ls" },
		})
	end,
}

return { mason, masonLspconfig }
