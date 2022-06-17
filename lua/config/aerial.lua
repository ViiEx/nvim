local status_ok, aerial = pcall(require, "aerial")
if status_ok then
	aerial.setup({
		close_behavior = "global",
		backends = { "lsp", "treesitter", "markdown" },
		min_width = 28,
		show_guides = true,
		filter_kind = false,
		icons = {
			Array = "",
			Boolean = "⊨",
			Class = "",
			Constant = "",
			Constructor = "",
			Key = "",
			Function = "",
			Method = "ƒ",
			Namespace = "",
			Null = "NULL",
			Number = "#",
			Object = "⦿",
			Property = "",
			TypeParameter = "𝙏",
			Variable = "",
			Enum = "ℰ",
			Package = "",
			EnumMember = "",
			File = "",
			Module = "",
			Field = "",
			Interface = "ﰮ",
			String = "𝓐",
			Struct = "𝓢",
			Event = "",
			Operator = "+",
		},
		guides = {
			mid_item = "├ ",
			last_item = "└ ",
			nested_top = "│ ",
			whitespace = "  ",
		},
		on_attach = function(bufnr)
			-- Toggle aerial window
			vim.keymap.set("n", "\\s", "<Cmd>AerialToggle!<CR>", map_opts)
			-- Focus aerial window
			vim.keymap.set("n", "<Leader>ss", "<Cmd>AerialOpen<CR>", map_opts)
			-- Jump forwards/backwards
			vim.keymap.set("n", "[s", "<cmd>AerialPrev<CR>", map_opts)
			vim.keymap.set("n", "]s", "<cmd>AerialNext<CR>", map_opts)
			-- Jump up the tree
			vim.keymap.set("n", "[S", "<cmd>AerialPrevUp<CR>", map_opts)
			vim.keymap.set("n", "]S", "<cmd>AerialNextUp<CR>", map_opts)
		end,
	})
end
