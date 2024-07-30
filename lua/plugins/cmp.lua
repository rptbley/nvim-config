local cmp = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    'onsails/lspkind.nvim',
    'rcarriga/cmp-dap'
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require('lspkind')

    cmp.setup({
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require('cmp_dap').is_dap_buffer()
      end,
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true
        })
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype({ 'dap-repl', 'dapui-watches', 'dapui-hover' }, {
      sources = {
        { name = 'dap' }
      }
    })
  end,
}

return { cmp }
