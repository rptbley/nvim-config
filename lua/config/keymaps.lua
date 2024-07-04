local builtin = require("telescope.builtin")
local wk = require("which-key")

-- neotree
wk.register({
	name = "NeoTree",
	["1"] = { ":Neotree<CR>", "toggle" },
	["2"] = { ":Neotree git_status<CR>", "Git status" },
	["3"] = { ":Neotree buffers<CR>", "Current Open Files" },
}, { prefix = "<leader>n" })

-- telescope
wk.register({
	name = "Telescope",
	f = { builtin.find_files, "Find file" },
	g = { builtin.live_grep, "Live grep" },
}, { prefix = "<leader>f" })

-- lspsaga
wk.register({
	name = "Lspsaga",
	h = { ":Lspsaga finder<CR>", "File Search" },
	r = { ":Lspsaga rename ++project", "Rename" },
	t = { ":Lspsaga peek_type_definition", "Show Type" },
	p = { ":Lspsaga peek_definition", "Show definition" },
	d = { ":Lspsaga goto_definition", "Go to definition" },
	["sl"] = { ":Lspsaga show_line_diagnostics", "Show Line Diagnostics" },
	o = { ":Lspsaga outline<CR>", "Lspsaga outline" },
	K = { ":Lspsaga hover_doc<CR>", "Show Documentation" },
}, { prefix = "<leader>g" })

-- bufferline
wk.register({
	["<Tab>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
	["<leader>Tab"] = { ":BufferLineCyclePrev<CR>", "Prev Buffer" },
	["bd"] = { ":bdelete<CR>", "Close Buffer" },
})

-- split window
wk.register({
	name = "View",
	v = { ":vsplit<CR><C-w>l", "Split view vertically" },
	h = { ":split<CR>", "Split view horizentally" },
	t = { ":tabedit<CR>", "Create New Tab" },
}, { prefix = "<leader>w" })

-- splitmove
wk.register({
	name = "Move View",
	["<C-h"] = { ":TmuxNavigateLeft<CR>", "Move View Left" },
	["<C-l>"] = { ":TmuxNavigateRight<CR>", "Move View Right" },
	["<C-k>"] = { ":TmuxNavigateUp<CR>", "Move View Up" },
	["<C-j>"] = { ":TmuxNavigateDown<CR>", "Move View Down" },
})

-- git sign
local gs = package.loaded.gitsigns
wk.register({
	s = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
	r = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
	S = { gs.stage_buffer, "Stage buffer" },
	u = { gs.undo_stage_hunk, "Undo Stage hunk" },
	R = { gs.reset_buffer, "Reset buffer" },
	p = { gs.preview_hunk, "Preview hunk" },
	b = {
		function()
			gs.diffthis("~")
		end,
		"Git diff",
	},
	["td"] = { gs.toggle_deleted, "Toggle deleted" },
}, { prefix = "<leader>h" })
