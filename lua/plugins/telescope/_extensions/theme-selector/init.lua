local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	vim.api.nvim_notify("Missing telescope.nvim", vim.log.levels.ERROR, {
		icon = " ",
		title = "ViiNvim",
	})
	return
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local config = require("telescope.config")

local util = require("telescope._extensions.colo.util")
local action_state = require("telescope.actions.state")
local previewer = require("telescope._extensions.colo.preview")

local defaults = {
	theme = "catppuccin-latte",
	separator = "┃  ",
	exclude = {},
	highlights = {
		name = "NONE",
		background = {
			dark = "@debug",
			light = "@label",
		},
		pack = {
			["base16"] = "Operator",
			["single"] = "Directory",
			["sexy"] = "Keyword",
			["decay"] = "Question",
			["dkeg"] = "Macro",
			["stardew"] = "Number",
			["hybrid"] = "Todo",
			["tempus"] = "Float",
		},
	},
}

local function setup(opts)
	defaults = vim.tbl_deep_extend("force", defaults, vim.F.if_nil(opts, {}))
end

local function choose_theme(opts)
	opts = vim.tbl_deep_extend("keep", vim.F.if_nil(opts, {}), defaults)
	pickers
		.new(opts, {
			prompt_title = "ViiVim themes",
			finder = finders.new_table(util.entries(opts)),
			sorter = config.values.generic_sorter(opts),
			previewer = previewer.new(opts),
			attach_mappings = function(buffer)
				actions.select_default:replace(function()
					actions.close(buffer)
					vim.cmd.colorscheme(action_state.get_selected_entry().value)
				end)
				return true
			end,
		})
		:find()
end

return telescope.register_extension({
	setup = setup,
	exports = {
		choose_theme = choose_theme,
	},
})
