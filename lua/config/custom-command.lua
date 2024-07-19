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
			vim.cmd("NeoTreeClose")
		else
			vim.cmd("NeoTreeFocus")
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
		vim.cmd(":bdelete|:NeoTreeFocus")
	end
end, {})
