local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'frappe',
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        notify = true,
        noice = true,
        dap = true,
        dap_ui = true,
        telescope = {
          enabled = true,
        }
      }
    })
  end
}

return M
