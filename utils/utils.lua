local M = {}
M.get_file_name = function()
	-- local full_path = vim.cmd("ls %")
	local full_path = "~/personal-projects/qwik-snippets.nvim/utils/utils.lua"
	local _, last_index = string.find(full_path, '^.*()/')
	local file_name = string.sub(full_path, last_index + 1)
	return file_name
end
return M
