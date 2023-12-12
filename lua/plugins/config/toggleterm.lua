local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end
toggleterm.setup({
	size = 10,
	open_mapping = [[<leader>tt]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	winbar = {
		enable = true,
		name_formatter = function(term)
			if term.direction == "horizontal" then
				return " " .. term:_display_name() .. " "
			end
			return term.name .. " ﬿"
		end,
	},
})
