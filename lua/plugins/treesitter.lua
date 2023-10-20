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
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          typescript = { __default = "// %s", __multiline = "/* %s */" },
          javascript = {
            __default = "// %s",
            jsx_element = "{/* %s */}",
            jsx_fragment = "{/* %s */}",
            jsx_attribute = "// %s",
            comment = "// %s",
          },
        },
      },
    })
  end,
}

return { M }
