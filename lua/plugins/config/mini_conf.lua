local status_ok, mini = pcall(require, "mini")

if not status_ok then
	return
end

local animate_options = {
	scroll = {
		enable = false,
	},

	resize = {
		enable = true,
	},

	open = {
		enable = true,
	},

	close = {
		enable = true,
	},
}

local files_options = {
	mappings = {
		close = "q",
		go_in = "<RIGHT>",
		go_in_plus = "<C-RIGHT>",
		go_out = "<LEFT>",
		go_out_plus = "<C-LEFT>",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},
	windows = {
		preview = true,
	},
}

require("mini.animate").setup(animate_options)
require("mini.files").setup(files_options)
