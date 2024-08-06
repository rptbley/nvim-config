-- neotree custom command
local function is_neotree_open_and_focused()
  local neotree_open = false
  local neotree_focused = false
  local current_win = vim.api.nvim_get_current_win()

  for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if buf_ft == "neo-tree" then
      neotree_open = true
      if win == current_win then
        neotree_focused = true
      end
    end
  end

  return neotree_open, neotree_focused
end

vim.api.nvim_create_user_command("NeotreeCustom", function()
  local neotree_open, neotree_focused = is_neotree_open_and_focused()

  if neotree_open then
    if neotree_focused then
      vim.cmd("Neotree close")
    else
      vim.cmd("Neotree focus")
    end
  else
    vim.cmd("Neotree")
  end
end, {})

-- buffer custom command
vim.api.nvim_create_user_command("CustomCloseBuffer", function()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  if #buffers > 1 then
    vim.cmd("bp|bd #")
  else
    vim.cmd(":bdelete|:Neotree")
  end
end, {})

-- go to definition and list of references
local telescope = require("telescope.builtin")
vim.api.nvim_create_user_command("CustomGoToDefinition", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_position_params()
  local current_buffer_uri = params.textDocument.uri

  vim.lsp.buf_request_all(bufnr, 'textDocument/definition', params, function(results_per_client)
    local result_buffer_uri = ''

    for key, value in pairs(results_per_client[1].result[1]) do
      local lowercaseKey = string.lower(key)

      if string.find(lowercaseKey, 'uri') then
        result_buffer_uri = value
      end
    end

    if current_buffer_uri == result_buffer_uri then
      telescope.lsp_references()
    else
      telescope.lsp_definitions()
    end
  end)
end, {})
