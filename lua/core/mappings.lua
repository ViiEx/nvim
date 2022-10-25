-- n, v, i, t = mode names

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

local toggle_term_cmd = require("core.utils").toggle_term_cmd

M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "beginning of line" },
		["<C-e>"] = { "<End>", "end of line" },

		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "move left" },
		["<C-l>"] = { "<Right>", "move right" },
		["<C-j>"] = { "<Down>", "move down" },
		["<C-k>"] = { "<Up>", "move up" },
	},

	n = {
		["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

		-- switch between windows
		["<C-h>"] = { "<C-w>h", "window left" },
		["<C-l>"] = { "<C-w>l", "window right" },
		["<C-j>"] = { "<C-w>j", "window down" },
		["<C-k>"] = { "<C-w>k", "window up" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "save file" },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

		-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
		-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
		-- empty mode is same as using <cmd> :map
		-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

		-- new buffer
		["<leader>b"] = { "<cmd> enew <CR>", "new buffer" },

		["<C-n>"] = { "<cmd>Neotree toggle<CR>", "Open File tree", opts = { silent = true } },

		["<leader>f"] = {
			":lua require('telescope.builtin').find_files()<CR>",
			"Open telescope",
			opts = { silent = true },
		},

		["<leader>fw"] = {
			":lua require('telescope.builtin').live_grep()<cr>",
			"Word loopup",
			opts = { silent = true },
		},
		["<leader>fe"] = {
			":lua require'telescope.builtin'.symbols{ sources = {'kaomoji', 'gitmoji'} }<cr>",
			opts = { silent = true },
		},

		["<leader>gg"] = {
			function()
				toggle_term_cmd("lazygit")
			end,
			desc = "ToggleTerm lazygit",
		},
		["<C-`>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
		["<leader>t"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },

		["<a-cr>"] = { "<cmd>lua require'lspactions'.code_action()<cr>", "Code Action", opts = { silent = true } },
		["<leader>lr"] = { "<cmd>lua require'lspactions'.rename()<cr>", "Rename", opts = { silent = true } },
	},

	t = { ["<C-x>"] = { termcodes("<C-\\><C-N>"), "escape terminal mode" } },

	v = {
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
	},

	x = {
		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		-- Don't copy the replaced text after pasting in visual mode
		-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
		["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
	},
}

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"lsp definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"lsp code_action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"goto prev",
		},

		["d]"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"list workspace folders",
		},
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<C-/>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["<C-/>"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

return M
