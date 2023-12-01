local M = {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = 'wrapped-compact',
      stages = 'slide'
    })
  end
}

return M
