require("config/settings")
require("config/lazy")
require("config/custom-command")
require("config/keymaps")

vim.cmd([[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls.jdtls_setup'.setup()
augroup end
]])

vim.cmd("set termguicolors")
vim.cmd.colorscheme("everforest")

local uv = vim.loop
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.env.TMUX_PLUGIN_MANAGER_PATH then
      uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. "/tmux-window-name/scripts/rename_session_windows.py", {})
    end
  end,
})
