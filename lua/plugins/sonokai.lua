local M = {
  'sainnhe/sonokai',
  lazy = false,
  proiority = 1000,
  config = function()
    local option = vim.g
    option.sonokai_enable_italic = 1
    option.sonokai_style = 'default'
    option.sonokai_better_performance = 1
    option.sonokai_menu_selection_background = 'green'
    option.sonokai_diagnostic_text_highlight = 1
  end
}

return M
