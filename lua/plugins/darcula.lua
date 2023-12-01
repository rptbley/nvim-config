local M = {
  'briones-gabriel/darcula-solid.nvim',
  dependencies = {
    'rktjmp/lush.nvim'
  },
  init = function()
    vim.cmd 'colorscheme darcula-solid'
    vim.cmd 'set termguicolors'
  end
}

return M
