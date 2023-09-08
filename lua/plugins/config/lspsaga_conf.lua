local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
	return
end

lspsaga.setup({
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = false,
		sign_priority = 40,
		virtual_text = false,
	},
	ui = {
		-- This option only works in Neovim 0.9
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = "󰏷 ",
		outgoing = "󰏻 ",
		hover = " ",
		kind = {
			["Folder"] = { " ", "@comment" },
		},
	},
})
