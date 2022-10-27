local noice_ok, noice = pcall(require, "noice")

if not noice_ok then
	return
end

noice.setup({
	routes = {
		{
			view = "cmdline_popup",
			filter = { event = "cmdline" },
		},
		{
			view = "confirm",
			filter = {
				any = {
					{ event = "msg_show", kind = "confirm" },
					{ event = "msg_show", kind = "confirm_sub" },
				},
			},
		},
		{
			view = "split",
			filter = {
				any = {
					{ event = "msg_history_show" },
				},
			},
		},
		{
			filter = {
				any = {
					{ event = { "msg_showmode", "msg_showcmd", "msg_ruler" } },
					{ event = "msg_show", kind = "search_count" },
				},
			},
			opts = { skip = true },
		},
		{
			view = "notify",
			filter = {
				event = "msg_show",
				kind = { "", "echo", "echomsg" },
			},
			opts = {
				replace = true,
				merge = true,
				title = "IDE",
			},
		},
		{
			view = "notify",
			filter = { error = true },
			opts = {
				title = "ERROR",
			},
		},
		{
			view = "notify",
			filter = { warning = true },
			opts = {
				title = "WARNING",
			},
		},
		{
			view = "notify",
			filter = { event = "notify" },
			opts = {
				title = "IDE",
			},
		},
		{
			view = "notify",
			filter = {
				event = "noice",
				kind = { "stats", "debug" },
			},
			opts = {
				buf_options = { filetype = "lua" },
				replace = true,
				title = "IDE",
			},
		},
		{
			view = "mini",
			filter = { event = "lsp" },
		},
		{
			view = "notify",
			filter = {},
			opts = {
				title = "IDE",
			},
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	cmdline = {
		format = {
			cmdline = { icon = ">" },
			search_down = { icon = "🔍⌄" },
			search_up = { icon = "🔍⌃" },
			filter = { icon = "$" },
			lua = { icon = "☾" },
			help = { icon = "?" },
		},
	},
})