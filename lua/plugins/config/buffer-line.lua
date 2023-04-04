local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

local function is_ft(b, ft)
	return vim.bo[b].filetype == ft
end

local function custom_filter(buf, buf_nums)
	local logs = vim.tbl_filter(function(b)
		return is_ft(b, "log")
	end, buf_nums or {})
	if vim.tbl_isempty(logs) then
		return true
	end
	local tab_num = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")
	local is_log = is_ft(buf, "log")
	if last_tab == 1 then
		return true
	end
	-- only show log buffers in secondary tabs
	return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
end

local options = {
	options = {
		mode = "buffers",
		numbers = "none",
		close_command = function(bufnr)
			require("core.utils").buf_kill("bd", bufnr, false)
		end,
		right_mouse_command = "vert sbuffer %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "X",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf)
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 14,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 15,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		diagnostics_indicator = diagnostics_indicator,
		custom_filter = custom_filter,
		offsets = {
			{ filetype = "neo-tree", text = "", padding = 1 },
		},
		color_icons = true,
		show_buffer_icons = false,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "none", -- "thin"
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "id",
	},
}

bufferline.setup(options)
