local M = {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      sync_install = true,
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "vim",
        "regex",
      },
    })
  end,
}

return { M }
