-- More configs taken from nvChad
local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

local utils = require("core.utils")
local HL = utils.HL

HL("DiffAdd", { foreground = "#79DCAA" })
HL("DiffChange", { foreground = "#C397D8" })
HL("DiffDelete", { foreground = "#F87070" })
HL("DiffText", { foreground = "#7AB0DF" })

local options = {
	signs = {
		add = { texthl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = {
			hl = "DiffChange",
			text = "│",
		},
		delete = {
			hl = "DiffDelete",
			text = "",
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
