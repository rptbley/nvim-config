local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }

-- neotree
keymap("n", "<leader>1", ":NeotreeCustom<CR>", opt)

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>ff", telescope.find_files, opt)
keymap("n", "<leader>fg", telescope.live_grep, opt)
keymap("n", "<leader>fe", telescope.oldfiles, opt)

-- lspsaga
keymap("n", "gd", ":Lspsaga goto_definition<CR>", opt)
keymap("n", "gf", ":Lspsaga finder<CR>", opt)
keymap("n", "K", ":Lspsaga hover_doc<CR>", opt)
keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
keymap("n", "<leader>rn", ":Lspsaga rename<CR>", opt)
keymap('n', '<F2>', ":Lspsaga diagnostic_jump_next<CR>", opt)

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

-- debug and test
keymap('n', '<F5>', ':DapContinue<CR>', opt)
keymap('n', '<F6>', ':DapStepOver<CR>', opt)
keymap('n', '<F7>', ':DapStepInto<CR>', opt)
keymap('n', '<F8>', ':DapStepOut<CR>', opt)
keymap('n', '<leader>bp', ':DapToggleBreakpoint<CR>', opt)
keymap('n', '<leader>bn', ':DapNew<CR>|:lua require("dapui").open()<CR>', opt)
keymap('n', '<leader>bt', ':DapTerminate<CR>|:lua require("dapui").close()<CR>', opt)

local dapui = require('dapui')
keymap('n', '<F3>', dapui.toggle, opt)

keymap('n', '<leader>tm', ':lua require("dapui").open()<CR>|:lua require("jdtls").test_nearest_method()<CR>', opt)
keymap('n', '<leader>tc', ':lua require("dapui").open()<CR>|:lua require("jdtls").test_class()<CR>', opt)
