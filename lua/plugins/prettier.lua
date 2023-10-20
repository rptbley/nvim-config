local M = {
  "MunifTanjim/prettier.nvim",
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = "prettier", -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "lua",
      },
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({ check_package_json = true })
        end,
        runtime_condition = function(params)
          return true
        end,
        timeout = 5000,
      },
    })
  end,
}

return { M }
