---------------------------------
-- Syntax highlighting
---------------------------------
local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

require("base46").load_highlight("treesitter")

local options = {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"elixir",
		"fish",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"python",
		"regex",
		"ruby",
		"rust",
		"scss",
		"sql",
		"toml",
		-- "tsx",
		-- "typescript",
		"vim",
		"yaml",
	},
	highlight = { enable = true, use_languagetree = true },
	indent = { enable = true },
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"svelte",
			"typescript",
			"typescriptreact",
			"vue",
			"xml",
		},
	},
}

treesitter.setup(options)
