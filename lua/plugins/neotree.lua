local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    require("neo-tree").setup({
      source_selector = {
        winbar = true,
        sources = {
          {
            source = "filesystem",
            display_name = " 󰉓 Files "
          },
          {
            source = "buffers",
            display_name = " 󰈚 Buffers "
          },
          {
            source = "git_status",
            display_name = " 󰊢 Git "
          },
        },
      },
      window = {
        mappings = {
          ["o"] = "open",
          ["<Tab>"] = "next_source",
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
      }
    })
  end,
}

return { M }
