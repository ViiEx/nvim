local status_ok, coke = pcall(require, "cokeline")

if not status_ok then
	return
end

local hlgroups = require("cokeline.hlgroups")

local options = {
	show_if_buffers_are_at_least = 2,

	buffers = {
		filter_valid = false,

		filter_visible = false,

		focus_on_delete = "next",

		new_buffers_position = "last",

		delete_on_right_click = true,
	},

	mappings = {
		cycle_prev_next = true,

		disable_mouse = false,
	},

	history = {
		enabled = true,
		size = 2,
	},

	rendering = {
		max_buffer_width = 999,
	},

	pick = {
		use_filename = true,

		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP",
	},

	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and "#1D1C19" or "#1D1C19"
		end,
		bg = function(buffer)
			return "#1D1C19"
		end,
		sp = nil,
		bold = function(buffer)
			return buffer.is_focused and true or false
		end,
		italic = nil,
		underline = nil,
		undercurl = nil,
		strikethrough = nil,
	},

	fill_hl = "TabLineFill",

	components = {
		{
			text = "",
			fg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
			bg = function(buffer)
				return buffer.is_first and "#1D1C19" or "#938AA9"
			end,
			style = nil,
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				-- return buffer.devicon.color
				return buffer.is_focused and "#DCD7BA" or "#1D1C19"
			end,
			bg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
		},
		{
			text = " ",
			bg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			style = function(buffer)
				return buffer.is_focused and "bold" or nil
			end,
			bg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
			fg = function(buffer)
				return buffer.is_focused and "#DCD7BA" or "#1D1C19"
			end,
		},
		{
			text = function(buffer)
				return buffer.is_modified and " " or ""
			end,
			fg = "#98BB6C",
			bg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
		},
		{
			text = function(buffer)
				if buffer.is_hovered then
					return " 󰅙 "
				else
					return " 󰅚 "
				end
			end,
			delete_buffer_on_left_click = true,
			bg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
			fg = function(buffer)
				return buffer.is_focused and "#DCD7BA" or "#1D1C19"
			end,
		},
		{
			text = "",
			fg = function(buffer)
				return buffer.is_focused and "#7E9CD8" or "#938AA9"
			end,
			bg = function(buffer)
				return buffer.is_last and "#1D1C19" or "#938AA9"
			end,
			style = nil,
		},
	},

	rhs = {},

	tabs = {
		placement = "right",
		components = {},
	},

	sidebar = {
		filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
		components = {
			{
				text = "File Explorer",
				fg = "#c4b28a",
				bg = "#181616",
				bold = true,
			},
		},
	},
}

coke.setup(options)
