local ensure_installed = { "tsserver", "lua_ls", "jsonls", "html", "cssls", "cssmodules_ls", "bashls", "jdtls" }

local lspConfig = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp"
  },
  enabled = true,
  build = ":MasonUpdate",
  config = function()
    -- mason setup
    require("mason").setup()

    -- mason lsp-config setup
    require("mason-lspconfig").setup({ ensure_installed = ensure_installed })

    -- lsp-config setup
    -- before setup lsp-config remove jdtls from ensure_installed
    table.remove(ensure_installed, #ensure_installed)

    -- set hover doc border rounded
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    -- set diagnostic setup
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        border = 'rounded'
      }
    })

    -- set autocomplete
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- setup lsp
    local bash_setup = {
      handlers = handlers,
      filetypes = { "sh", "zsh" },
      capabilities = capabilities,
      root_dir = function() return vim.loop.cwd() end,
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.command)",
        },
      },
    }

    local lua_setup = {
      handlers = handlers,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
      capabilities = capabilities,
    }

    local other_setup = {
      handlers = handlers,
      capabilities = capabilities,
    }

    local lspconfig = require("lspconfig")
    for _, lsp in ipairs(ensure_installed) do
      if lsp == "bashls" then
        lspconfig[lsp].setup(bash_setup)
      elseif lsp == "lua_ls" then
        lspconfig[lsp].setup(lua_setup)
      else
        lspconfig[lsp].setup(other_setup)
      end
    end
  end,
}

return lspConfig
