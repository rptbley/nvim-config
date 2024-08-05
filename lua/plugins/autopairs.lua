local autopairs = {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({})
  end,
}

local autotags = {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
    })
  end,
}

return { autopairs, autotags }
