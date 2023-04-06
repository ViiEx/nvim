local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local btn_gen = require("core.utils").generate_button

local default_header = {
	type = "text",
	val = require("core.banners")["pacman"],
	opts = {
		position = "center",
		hl = "AlphaHeader",
		-- wrap = "overflow";
	},
}

local plugins = require("lazy").stats().count

local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
local date = thingy:read("*a")
thingy:close()

local heading = {
	type = "text",
	val = "┌─   Today is " .. date .. " ─┐",
	opts = {
		position = "center",
		hl = "AlphaHeader",
	},
}

local plugin_count = {
	type = "text",
	val = "└─   " .. plugins .. " plugins in total ─┘",
	opts = {
		position = "center",
		hl = "AlphaFooter",
	},
}

local footer = {
	type = "text",
	val = {
		"-Man is a being in search of meaning-",
		"                              - Plato",
	},
	opts = {
		position = "center",
		hl = "AlphaFooter",
	},
}

local buttons = {
	type = "group",
	val = {
		btn_gen(function()
			require("telescope.builtin").live_grep()
		end, {
			width = 25,
			cursor = 15,
			align = "center",
			spacing = 2,
			shortcut = { value = " LDR f w ", align = "right", hl = "AlphaKeyPrefix", lead = " ", trail = " " },
			label = { value = "Grep", hl = "MoreMsg" },
			icon = { value = " ", hl = "MsgSeparator" },
		}),
		btn_gen(function()
			require("telescope.builtin").find_files()
		end, {
			width = 25,
			cursor = 5,
			align = "center",
			spacing = 2,
			shortcut = { value = " LDR f f ", align = "right", hl = "AlphaKeyPrefix", lead = " ", trail = " " },
			label = { value = "Files", hl = "MoreMsg" },
			icon = { value = " ", hl = "MsgSeparator" },
		}),
		btn_gen(function()
			require("telescope.builtin").keymaps()
		end, {
			width = 25,
			cursor = 5,
			align = "center",
			spacing = 2,
			shortcut = { value = " LDR t k ", align = "right", hl = "AlphaKeyPrefix", lead = " ", trail = " " },
			label = { value = "Keymaps", hl = "MoreMsg" },
			icon = { value = " ", hl = "MsgSeparator" },
		}),
	},
	opts = {
		spacing = 1,
		position = "center",
	},
}

local section = {
	header = default_header,
	buttons = buttons,
	plugin_count = plugin_count,
	heading = heading,
	footer = footer,
}

local opts = {
	layout = {
		{ type = "padding", val = 3 },
		section.header,
		{ type = "padding", val = 2 },
		section.heading,
		{ type = "padding", val = 1 },
		-- section.top_bar,
		section.buttons,
		{ type = "padding", val = 1 },
		section.plugin_count,
		-- section.bot_bar,
		{ type = "padding", val = 1 },
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

alpha.setup(opts)
