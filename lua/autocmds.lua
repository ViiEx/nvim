vim.cmd(
	[[autocmd FileType typescript,typescriptreact,javascript,javascriptreact autocmd BufWritePre <buffer> OrganizeImports]]
)

local M = {}
local api = vim.api

function M.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command("augroup " .. group_name)
		api.nvim_command("autocmd!")
		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			api.nvim_command(command)
		end
		api.nvim_command("augroup END")
	end
end

local autoCommands = {
	open_folds = {
		{ "BufReadPost, FileReadPost", "*", "normal zR" },
	},
}

M.nvim_create_augroups(autoCommands)

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter" }, {
	callback = function()
		require("core.statusline").setup()
	end,
})
