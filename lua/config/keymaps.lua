local builtin = require("telescope.builtin")
local wk = require("which-key")

-- neotree
wk.register({
  ["1"] = { ':Telescope file_browser<CR>', "File Browser" },
  ["2"] = { ":Neotree git_status<CR>", "Neotree Git status" },
  ["3"] = { ":Neotree buffers<CR>", "Neotree open buffers" },
}, { prefix = "<leader>" })

-- telescope
wk.register({
  name = "Telescope",
  f = { builtin.find_files, "Find file" },
  g = { builtin.live_grep, "Live grep" },
  e = { builtin.oldfiles, 'Current open files' }
}, { prefix = "<leader>f" })

-- lspsaga
wk.register({
  name = "Lspsaga",
  a = { ":Lspsaga code_action<CR>", "Code Action" },
  h = { ":Lspsaga finder<CR>", "File Search" },
  r = { ":Lspsaga rename ++project<CR>", "Rename" },
  t = { ":Lspsaga peek_type_definition<CR>", "Show Type" },
  p = { ":Lspsaga peek_definition<CR>", "Show definition" },
  d = { ":Lspsaga goto_definition<CR>", "Go to definition" },
  ["sl"] = { ":Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
  o = { ":Lspsaga outline<CR>", "Lspsaga outline" },
  K = { ":Lspsaga hover_doc<CR>", "Show Documentation" },
}, { prefix = "g" })

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
