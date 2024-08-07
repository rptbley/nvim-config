local jdtls = {
  'mfussenegger/nvim-jdtls',
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'folke/neodev.nvim'
  },
  config = function()
    require('nvim-dap-virtual-text').setup()
    local dapui = require('dapui')

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = 'scopes',      size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks',      size = 0.25 },
            { id = 'watches',     size = 0.25 },
          },
          position = 'left',
          size = 70
        },
        {
          elements = {
            { id = 'console', size = 0.5 },
            { id = 'repl',    size = 0.5 },
          },
          position = 'bottom',
          size = 30
        }
      }
    })

    require('neodev').setup({
      library = {
        types = true,
        plugins = {
          'nvim-dap-ui'
        }
      }
    })

    local sign = vim.fn.sign_define

    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  end
}

return jdtls
