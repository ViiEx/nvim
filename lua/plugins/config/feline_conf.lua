-- Taken from @dharmx at github
-- Link: https://github.com/dharmx/
-- Repo: nvim-colo

local ok, feline = pcall(require, "feline")

if not ok then
	return
end

local col = require("core.colo.theme.radium")

local theme = {
	fg = col.white:darken(5),
	bg = col.black:lighten(6),
	green = col.green,
	yellow = col.yellow,
	purple = col.magenta,
	orange = col.bright_yellow:saturate(5),
	cyan = col.cyan,
	red = col.red,
	aqua = col.blue,
	blue = col.bright_blue,
	darkred = col.bright_red,
	gray = col.black:lighten(6):brighten(2),
	pink = col.magenta:spin(0.1),
	lime = col.bright_cyan,
}

for key, value in pairs(theme) do
	theme[key] = value:HEX(true)
end

local mode_theme = {
	["NORMAL"] = theme.green,
	["OP"] = theme.cyan,
	["INSERT"] = theme.aqua,
	["VISUAL"] = theme.yellow,
	["LINES"] = theme.darkred,
	["BLOCK"] = theme.orange,
	["REPLACE"] = theme.purple,
	["V-REPLACE"] = theme.pink,
	["ENTER"] = theme.pink,
	["MORE"] = theme.pink,
	["SELECT"] = theme.darkred,
	["SHELL"] = theme.cyan,
	["TERM"] = theme.lime,
	["NONE"] = theme.gray,
	["COMMAND"] = theme.blue,
}

local modes = setmetatable({
	["n"] = "N",
	["no"] = "N",
	["v"] = "V",
	["V"] = "VL",
	[""] = "VB",
	["s"] = "S",
	["S"] = "SL",
	[""] = "SB",
	["i"] = "I",
	["ic"] = "I",
	["R"] = "R",
	["Rv"] = "VR",
	["c"] = "C",
	["cv"] = "EX",
	["ce"] = "X",
	["r"] = "P",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "SH",
	["t"] = "T",
}, {
	__index = function()
		return "-"
	end,
})

local component = {}

component.vim_mode = {
	provider = function()
		return modes[vim.api.nvim_get_mode().mode]
	end,
	hl = function()
		return {
			fg = "bg",
			bg = require("feline.providers.vi_mode").get_mode_color(),
			style = "bold",
			name = "NeovimModeHLColor",
		}
	end,
	left_sep = "block",
	right_sep = "block",
}

component.git_branch = {
	provider = "git_branch",
	hl = {
		fg = "fg",
		bg = "bg",
		style = "bold",
	},
	left_sep = "block",
	right_sep = "",
}

component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = "purple",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.separator = {
	provider = "",
	hl = {
		fg = "bg",
		bg = "bg",
	},
}

component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = "red",
	},
}

component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = "yellow",
	},
}

component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = "aqua",
	},
}

component.diagnostic_info = {
	provider = "diagnostic_info",
}

component.lsp = {
	provider = function()
		if not rawget(vim, "lsp") then
			return ""
		end

		local progress = vim.lsp.util.get_progress_messages()[1]
		if vim.o.columns < 120 then
			return ""
		end

		local clients = vim.lsp.get_active_clients({ bufnr = 0 })
		if #clients ~= 0 then
			if progress then
				local spinners = {
					"◜ ",
					"◠ ",
					"◝ ",
					"◞ ",
					"◡ ",
					"◟ ",
				}
				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners
				local content = string.format("%%<%s", spinners[frame + 1])
				return content or ""
			else
				return "󰘽 LSP"
			end
		end
		return ""
	end,
	hl = function()
		local progress = vim.lsp.util.get_progress_messages()[1]
		return {
			fg = progress and "yellow" or "green",
			bg = "gray",
			style = "bold",
		}
	end,
	left_sep = "",
	right_sep = "block",
}

component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = "fg",
		bg = "gray",
	},
	left_sep = "block",
	right_sep = "block",
}

component.scroll_bar = {
	provider = function()
		local chars = {
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
		}
		local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
		local position = math.floor(line_ratio * 100)

		local label
		if position <= 5 then
			label = " TOP"
		elseif position >= 95 then
			label = " BOT"
		else
			label = chars[math.floor(line_ratio * #chars)] .. position
		end
		return label
	end,
	hl = function()
		local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
		local fg
		local style

		if position <= 5 then
			fg = "aqua"
			style = "bold"
		elseif position >= 95 then
			fg = "red"
			style = "bold"
		else
			fg = "purple"
			style = nil
		end
		return {
			fg = fg,
			style = "bold",
			bg = "bg",
		}
	end,
	left_sep = "block",
	right_sep = "block",
}

local left = {}
local middle = {}
local right = {
	component.vim_mode,
	component.file_type,
	component.lsp,
	component.git_branch,
	component.git_add,
	component.git_delete,
	component.git_change,
	component.separator,
	component.diagnostic_errors,
	component.diagnostic_warnings,
	component.diagnostic_info,
	component.diagnostic_hints,
	component.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = theme,
	vi_mode_colors = mode_theme,
})
