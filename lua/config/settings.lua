local option = vim.opt

vim.wo.number = true
option.title = true
option.autoindent = true
option.smartindent = true
option.hlsearch = false
option.backup = false
option.showcmd = true
option.cmdheight = 1
option.laststatus = 2
option.expandtab = true
option.scrolloff = 20
option.backupskip = { "/tmp/*", "/private/tmp/*" }
option.inccommand = "split"
option.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
option.smarttab = true
option.breakindent = true
option.shiftwidth = 2
option.tabstop = 2
option.wrap = false          -- No Wrap lines
option.backspace = { "start", "eol", "indent" }
option.path:append({ "**" }) -- Finding files - Search down into subfolders
option.wildignore:append({ "*/node_modules/*" })
option.cursorline = true
option.termguicolors = true
option.background = "dark"
vim.g.mapleader = " "
vim.cmd([[set clipboard=unnamedplus]])
vim.cmd([[set fencs=utf-8,euckr]])
