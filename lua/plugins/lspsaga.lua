local M = {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({})
  end,
}

return { M }
