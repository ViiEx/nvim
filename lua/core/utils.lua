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

--[[
--      Function from KrakeNvim
--]]

M.generate_button = function(callback, opts)
	local set = {
		type = "button",
		on_press = callback,
		val = ("%s%s%s"):format(opts.icon.value, (" "):rep(opts.spacing or 2), opts.label.value),
		opts = {
			position = vim.F.if_nil(opts.align, "center"),
			shortcut = vim.F.if_nil(opts.shortcut.value, "DUMMY"),
			cursor = vim.F.if_nil(opts.cursor, 5),
			width = vim.F.if_nil(opts.width, 25),
			align_shortcut = vim.F.if_nil(opts.shortcut.align, "center"),
			hl_shortcut = vim.F.if_nil(opts.shortcut.hl, "AlphaKeyPrefix"),
			hl = {},
		},
	}

	if opts.shortcut.before then
		set.opts.shortcut = opts.shortcut.before .. set.opts.shortcut
	else
		set.opts.shortcut = " " .. set.opts.shortcut
	end

	if opts.shortcut.after then
		set.opts.shortcut = set.opts.shortcut .. opts.shortcut.after
	else
		set.opts.shortcut = set.opts.shortcut .. " "
	end

	local icon_length = opts.icon.value:len()
	local label_length = opts.label.value:len()
	set.opts.hl = {
		{ opts.icon.hl, 1, icon_length },
		{ opts.label.hl, icon_length + opts.spacing, icon_length + (opts.spacing or 2) + label_length },
	}

	return set
end

M.buf_kill = function(kill_command, bufnr, force)
	kill_command = kill_command or "bd"

	local bo = vim.bo
	local api = vim.api
	local fmt = string.format
	local fnamemodify = vim.fn.fnamemodify

	if bufnr == 0 or bufnr == nil then
		bufnr = api.nvim_get_current_buf()
	end

	local bufname = api.nvim_buf_get_name(bufnr)

	if not force then
		local warning
		if bo[bufnr].modified then
			warning = fmt([[No write since last change for (%s)]], fnamemodify(bufname, ":t"))
		elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
			warning = fmt([[Terminal %s will be killed]], bufname)
		end
		if warning then
			vim.ui.input({
				prompt = string.format([[%s. Close it anyway? [y]es or [n]o (default: no): ]], warning),
			}, function(choice)
				if choice ~= nil and choice:match("ye?s?") then
					M.buf_kill(kill_command, bufnr, true)
				end
			end)
			return
		end
	end

	-- Get list of windows IDs with the buffer to close
	local windows = vim.tbl_filter(function(win)
		return api.nvim_win_get_buf(win) == bufnr
	end, api.nvim_list_wins())

	if force then
		kill_command = kill_command .. "!"
	end

	-- Get list of active buffers
	local buffers = vim.tbl_filter(function(buf)
		return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
	end, api.nvim_list_bufs())

	-- If there is only one buffer (which has to be the current one), vim will
	-- create a new buffer on :bd.
	-- For more than one buffer, pick the previous buffer (wrapping around if necessary)
	if #buffers > 1 and #windows > 0 then
		for i, v in ipairs(buffers) do
			if v == bufnr then
				local prev_buf_idx = i == 1 and #buffers or (i - 1)
				local prev_buffer = buffers[prev_buf_idx]
				for _, win in ipairs(windows) do
					api.nvim_win_set_buf(win, prev_buffer)
				end
			end
		end
	end

	-- Check if buffer still exists, to ensure the target buffer wasn't killed
	-- due to options like bufhidden=wipe.
	if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
		vim.cmd(string.format("%s %d", kill_command, bufnr))
	end
end

return M
