local mason = {
  "williamboman/mason.nvim",
  enabled = true,
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
}

local masonLspconfig = {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "tsserver", "lua_ls", "jsonls", "html", "cssls", "cssmodules_ls" },
    })
  end,
}

local lspConfig = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = { "tsserver", "lua_ls", "jsonls", "html", "cssls", "cssmodules_ls" }
    local lspconfig = require("lspconfig")
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
      })
    end

    lspconfig.bashls.setup({
      filetypes = { "sh", "zsh" },
    })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })
  end
}

return { mason, masonLspconfig, lspConfig }
