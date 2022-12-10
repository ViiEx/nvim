local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local btn_gen = require("core.utils").btn_gen

local default_header = {
	type = "text",
	val = require("core.banners")["krakedking"],
	opts = {
		position = "center",
		hl = "AlphaHeader",
		-- wrap = "overflow";
	},
}

local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
local plugins = handle:read("*a")
handle:close()

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

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 24,
		align_shortcut = "right",
		hl_shortcut = "AlphaButtons",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		btn_gen("  Find File", " LDR f f ", "AlphaButtonLabelText", "WildMenu"),
		btn_gen("  Grep word", " LDR f w ", "AlphaButtonLabelText", "String"),
		btn_gen("  Emoji", " LDR f e ", "AlphaButtonLabelText", "String"),
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
