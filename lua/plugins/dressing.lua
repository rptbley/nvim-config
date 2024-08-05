local M = {
  "stevearc/dressing.nvim",
  config = function()
    require('dressing').setup({
      input = {
        enabled = true,
        border = 'rounded',
        relative = 'cursor',
        trim_prompt = true,
        title_pos = 'center',
        start_in_insert = false,
        mappings = {
          n = {
            ['<Esc>'] = 'Close',
            ['q'] = 'Close',
            ['<CR>'] = 'Confirm'
          },
        }
      },
      select = {
        enabled = true,
        backend = 'builtin',
        builtin = {
          border = 'rounded',
          relative = 'cursor',
          mappings = {
            ['<Esc>'] = 'Close',
            ['q'] = 'Close',
            ['<CR>'] = 'Confirm'
          }
        }
      }
    })
  end
}

return M
