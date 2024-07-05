require("config/settings")
require("config/lazy")
require("config/keymaps")

vim.cmd([[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls.jdtls_setup'.setup()
augroup end
]])

vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme gruvbox]])
