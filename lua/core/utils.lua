local M = {}

local merge_tb = vim.tbl_deep_extend
local api = vim.api

M.user_terminals = {}

M.load_mappings = function(section, mapping_opt)
	local function set_section_map(section_values)
		if section_values.plugin then
			return
		end
		section_values.plugin = nil

		for mode, mode_values in pairs(section_values) do
			local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
			for keybind, mapping_info in pairs(mode_values) do
				-- merge default + user opts
				local opts = merge_tb("force", default_opts, mapping_info.opts or {})

				mapping_info.opts, opts.mode = nil, nil
				opts.desc = mapping_info[2]

				vim.keymap.set(mode, keybind, mapping_info[1], opts)
			end
		end
	end

	local mappings = require("core.mappings")

	if type(section) == "string" then
		mappings[section]["plugin"] = nil
		mappings = { mappings[section] }
	end

	for _, sect in pairs(mappings) do
		set_section_map(sect)
	end
end

M.toggle_term_cmd = function(term_details)
	-- if a command string is provided, create a basic table for Terminal:new() options
	if type(term_details) == "string" then
		term_details = { cmd = term_details, hidden = true }
	end
	-- use the command as the key for the table
	local term_key = term_details.cmd
	-- set the count in the term details
	if vim.v.count > 0 and term_details.count == nil then
		term_details.count = vim.v.count
		term_key = term_key .. vim.v.count
	end
	-- if terminal doesn't exist yet, create it
	if M.user_terminals[term_key] == nil then
		M.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
	end
	-- toggle the terminal
	M.user_terminals[term_key]:toggle()
end

--- Generates a button for alpha.nvim dashboard configuration.
-- @param label the text that will be displayed at this button
-- @param shortcut the shortcut key label text
-- @param hl_icon the highlight group of the label icon
-- @param hl_label the highlight group for the button label text
-- @return table options table that will be passed onto the alpha setup function
function M.btn_gen(label, shortcut, hl_label, hl_icon)
	return {
		type = "button",
		on_press = function()
			local key = api.nvim_replace_termcodes(shortcut:gsub("%s", ""):gsub("LDR", "<leader>"), true, false, true)
			api.nvim_feedkeys(key, "normal", false)
		end,
		val = label,
		opts = {
			position = "center",
			shortcut = shortcut,
			cursor = 5,
			width = 25,
			align_shortcut = "right",
			hl_shortcut = "AlphaKeyPrefix",
			hl = {
				{ hl_icon, 1, 3 }, -- highlight the icon glyph
				{ hl_label, 4, 15 }, -- highlight the part after the icon glyph
			},
		},
	}
end

return M
