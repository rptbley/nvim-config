local M = {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      definition = {
        show_floating_window = true,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
}

return M
