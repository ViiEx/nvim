-- n, v, i, t = mode names

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

local toggle_term_cmd = require("core.utils").toggle_term_cmd

M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },

		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "Move left" },
		["<C-l>"] = { "<Right>", "Move right" },
		["<C-j>"] = { "<Down>", "Move down" },
		["<C-k>"] = { "<Up>", "Move up" },
	},

	n = {
		["<ESC>"] = { "<cmd> noh <CR>", "No highlight" },

		-- switch between windows
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "Save file", opts = { silent = true } },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

		-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
		-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
		-- empty mode is same as using <cmd> :map
		-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
		["j"] = {
			'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
			"Moving the cursor through wrapped lines down",
			opts = { expr = true },
		},
		["k"] = {
			'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
			"Moving the cursor through wrapped lines up",
			opts = { expr = true },
		},
		["<Up>"] = {
			'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
			"Moving the cursor through wrapped lines up",
			opts = { expr = true },
		},
		["<Down>"] = {
			'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
			"Moving the cursor through wrapped lines down",
			opts = { expr = true },
		},

		-- new buffer
		["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },

		["<C-n>"] = { "<cmd>Neotree toggle<CR>", "Open File tree", opts = { silent = true } },

		["<leader>fe"] = {
			":lua require'telescope.builtin'.symbols{ sources = {'kaomoji', 'gitmoji'} }<cr>",
			"Emoji",
			opts = { silent = true },
		},

		["<leader>gg"] = {
			function()
				toggle_term_cmd("lazygit")
			end,
			"ToggleTerm lazygit",
		},
		["<C-`>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split" },
		["<leader>tt"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split" },

		["<a-cr>"] = { "<cmd>lua require'lspactions'.code_action()<cr>", "Code Action", opts = { silent = true } },
		["<leader>lr"] = { "<cmd>lua require'lspactions'.rename()<cr>", "Rename", opts = { silent = true } },

		["<leader>lf"] = {
			"<cmd>lua vim.diagnostic.open_float()<cr>",
			"Open floating diagnostics",
			opt = { silent = true },
		},
		["<C-/>"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle linewise" },

		["<TAB>"] = {
			"<cmd>BufferLineCycleNext<cr>",
			"Goto next buffer",
		},

		["<S-Tab>"] = {
			"<cmd>BufferLineCyclePrev<cr>",
			"Goto prev buffer",
		},
		["<leader>x"] = {
			function()
				require("core.utils").buf_kill("bd", bufnr, false)
			end,
			"Close buffer",
		},

		["<leader>ta"] = {
			"<CMD>AerialToggle!<CR>",
			"Toggle aerial",
		},

		["n"] = {
			"<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
			"Find with hlslens",
			opts = { noremap = true, silent = true },
		},

		["N"] = {
			"<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
			"Find with hlsLens",
			opts = { noremap = true, silent = true },
		},

		["<leader>gdh"] = {
			"<CMD>DiffviewFileHistory<CR>",
			"Diff view file history",
		},

		["<leader>nf"] = {
			"<CMD>lua require('neogen').generate()<CR>",
			"Generate Neogen",
			opts = { noremap = true, silent = true },
		},

		["<leader>cb"] = {
			function()
				require("core.utils").set_banners()
			end,
			"Set banners",
			opts = { silent = true },
		},
	},

	t = { ["<C-x>"] = { termcodes("<C-\\><C-N>"), "Escape terminal mode" } },

	v = {
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["<C-/>"] = { "<Plug>(comment_toggle_blockwise_visual)", "Comment toggle blockwise" },
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
			"Lsp declaration",
		},

		["gd"] = {
			"<cmd>Lspsaga goto_definition<CR>",
			"Lsp definition",
		},

		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation" },

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"Lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"Lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"Lsp definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"Lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"Lsp code_action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"Lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"Floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"Goto prev",
		},

		["d]"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"Goto_next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Lsp formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"Remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
		},

		["<leader>lo"] = {
			"<cmd>Lspsaga outline<cr>",
			"Lsp outline",
		},
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
		["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "Show keys" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

		-- theme switcher
		["<leader>th"] = { "<cmd> ColoTele <CR>", "Change theme" },

		-- File Browser
		["<C-\\>"] = { "<CMD> Telescope file_browser <CR> ", "Telescope file browser" },
	},
}

M.gitsigns = {
	plugin = true,

	n = {
		-- Navigation through hunks
		["]c"] = {
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to next hunk",
			opts = { expr = true },
		},

		["[c"] = {
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to prev hunk",
			opts = { expr = true },
		},

		-- Actions
		["<leader>rh"] = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"Reset hunk",
		},

		["<leader>ph"] = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"Preview hunk",
		},

		["<leader>gb"] = {
			function()
				package.loaded.gitsigns.blame_line()
			end,
			"Blame line",
		},

		["<leader>td"] = {
			function()
				require("gitsigns").toggle_deleted()
			end,
			"Toggle deleted",
		},
	},
}

return M
