-- More configs taken from nvChad
local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

local utils = require("core.utils")

local options = {
	signs = {
		add = { texthl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = {
			hl = "DiffChange",
			text = "│",
		},
		delete = {
			hl = "DiffDelete",
			text = "󰍵",
		},
		topdelete = {
			hl = "DiffDelete",
			text = "‾",
		},
		changedelete = {
			hl = "DiffChangeDelete",
			text = "~",
		},
		untracked = { hl = "DiffUntracked", text = "┆", numhl = "GitSignsUntrackedNr" },
	},
	current_line_blame = false,
	on_attach = function(bufnr)
		utils.load_mappings("gitsigns", { buffer = bufnr })
	end,
}

gitsigns.setup(options)
