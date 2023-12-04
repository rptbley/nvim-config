local key = vim.keymap.set
local silent = { silent = true }

-- neotree
key("n", "<leader>1", ":Neotree<CR>", silent)
key("n", "<leader>2", ":Neotree git_status<CR>", silent)
key("n", "<leader>3", ":Neotree buffers<CR>", silent)
-- telescope
local builtin = require("telescope.builtin")
key("n", "<leader>ff", builtin.find_files, {})
key("n", "<leader>fg", builtin.live_grep, {})
key("n", "<leader>bt", builtin.builtin, {})
-- lspsaga
key("n", "gh", "<cmd>Lspsaga finder<CR>", silent)
key({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", silent)
key("n", "gr", "<cmd>Lspsaga rename<CR>", silent)
key("n", "gr", "<cmd>Lspsaga rename ++project<CR>", silent)
key("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", silent)
key("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", silent)
key("n", "gp", "<cmd>Lspsaga peek_definition<CR>", silent)
key("n", "gd", "<cmd>Lspsaga goto_definition<CR>", silent)
key("n", "<leader>o", "<cmd>Lspsaga outline<CR>", silent)
key("n", "K", "<cmd>Lspsaga hover_doc<CR>", silent)
-- bufferline
key("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", silent)
key("n", "<leader><Tab>", "<cmd>BufferLineCyclePrev<CR>", silent)
key("n", "<leader>w", ":bdelete<CR>", silent)
-- split window
key("n", "<leader>v", ":vsplit<CR><C-w>l", silent)
key("n", "<leader>h", ":split<CR>", silent)
key("n", "<leader>te", ":tabedit<CR>", silent)
-- splitmove
key("n", "<C-h>", ":TmuxNavigateLeft<CR>", silent)
key("n", "<C-l>", ":TmuxNavigateRight<CR>", silent)
key("n", "<C-k>", ":TmuxNavigateUp<CR>", silent)
key("n", "<C-j>", ":TmuxNavigateDown<CR>", silent)
