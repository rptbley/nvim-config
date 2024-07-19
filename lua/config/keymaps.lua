local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }
-- neotree
keymap("n", "<leader>1", ":NeotreeCustom<CR>", opt)

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>ff", telescope.find_files, opt)
keymap("n", "<leader>fg", telescope.live_grep, opt)
keymap("n", "<leader>fe", telescope.oldfiles, opt)

-- lsp
-- wk.register({
-- 	["ga"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code action" },
-- 	["gd"] = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition" },
-- 	["gr"] = { ":lua vim.lsp.buf.references()<CR>", "Show references" },
-- 	["gK"] = { ":lua vim.lsp.buf.hover()<CR>", "Hover Documentation" },
-- })

-- bufferline
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
keymap("n", "<leader><Tab>", ":BufferLineCyclePrev<CR>", opt)
keymap("n", "<leader>w", ":CustomCloseBuffer<CR>", opt)

-- split window
keymap("n", "<leader>v", ":vsplit<CR><C-w>l", opt)
keymap("n", "<leader>h", ":split<CR>", opt)

-- splitmove
local tmuxNav = require("nvim-tmux-navigation")
keymap("n", "<C-h>", tmuxNav.NvimTmuxNavigateLeft, opt)
keymap("n", "<C-l>", tmuxNav.NvimTmuxNavigateRight, opt)
keymap("n", "<C-k>", tmuxNav.NvimTmuxNavigateUp, opt)
keymap("n", "<C-j>", tmuxNav.NvimTmuxNavigateDown, opt)

-- git sign
local gitsigns = require("gitsigns")
keymap("n", "<leader>hs", gitsigns.stage_hunk, opt)
keymap("n", "<leader>hr", gitsigns.reset_hunk, opt)
keymap("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opt)
keymap("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opt)
keymap("n", "<leader>hS", gitsigns.stage_buffer, opt)
keymap("n", "<leader>hu", gitsigns.undo_stage_hunk, opt)
keymap("n", "<leader>hR", gitsigns.reset_buffer, opt)
keymap("n", "<leader>hp", gitsigns.preview_hunk, opt)
keymap("n", "<leader>hb", function()
	gitsigns.blame_line({ full = true })
end, opt)
keymap("n", "<leader>tb", gitsigns.toggle_current_line_blame, opt)
keymap("n", "<leader>hd", gitsigns.diffthis, opt)
keymap("n", "<leader>hD", function()
	gitsigns.diffthis("~")
end, opt)
keymap("n", "<leader>td", gitsigns.toggle_deleted, opt)
