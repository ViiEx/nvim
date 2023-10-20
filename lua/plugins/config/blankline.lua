local status_ok, blankline = pcall(require, "ibl")

if not status_ok then
	return
end

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
	enabled = true,
	debounce = 200,
	viewport_buffer = {
		min = 30,
		max = 500,
	},
	indent = {
		char = "▎",
		tab_char = nil,
		highlight = highlight,
		smart_indent_cap = true,
		priority = 1,
	},
	whitespace = {
		highlight = "IblWhitespace",
		remove_blankline_trail = true,
	},
	scope = {
		enabled = true,
		char = nil,
		show_start = true,
		show_end = true,
		show_exact_scope = false,
		injected_languages = true,
		highlight = "IblScope",
		priority = 1024,
		include = {
			node_type = {},
		},
		exclude = {
			language = {},
			node_type = {
				["*"] = {
					"source_file",
					"program",
				},
				lua = {
					"chunk",
				},
				python = {
					"module",
				},
			},
		},
	},
	exclude = {
		filetypes = {
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
			"mason",
			"lazy",
			"terminal",
			"alpha",
		},
		buftypes = {
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
		},
	},
})
