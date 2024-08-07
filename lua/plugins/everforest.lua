local M = {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    local option = vim.g

    option.everforest_better_performance = 1
    option.everforest_enable_italic = 1
    option.everforest_background = 'soft'
    option.everforest_diagnostic_text_highlight = 1
    option.everforest_diagnostic_line_highlight = 1
  end
}

return M
