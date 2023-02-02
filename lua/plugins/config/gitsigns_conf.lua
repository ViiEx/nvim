-- More configs taken from nvChad
local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

local utils = require("core.utils")

local options = {
	signs = {
		add = {text = "│"},
		change = {text = "│"},
		delete = {text = ""},
		topdelete = {text = "‾"},
		changedelete = {text = "~"},
		untracked = {text = "┆"},
	},
    current_line_blame = false,
	on_attach = function(bufnr)
		utils.load_mappings("gitsigns", { buffer = bufnr })
	end,
}

gitsigns.setup(options)
