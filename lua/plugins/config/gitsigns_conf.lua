-- More configs taken from nvChad
local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

local utils = require("core.utils")

local options = {
	signs = {
		add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
		change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
		untracked = { hl = "DiffUntracked", text = "┆", numhl = "GitSignsUntrackedNr" },
	},
	current_line_blame = false,
	on_attach = function(bufnr)
		utils.load_mappings("gitsigns", { buffer = bufnr })
	end,
}

gitsigns.setup(options)
