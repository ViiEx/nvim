require("telescope").setup({
	extensions = {
		project = {
			base_dirs = {
				{ "~/Project/", max_depth = 4 },
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "svg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})
require("telescope").load_extension("project")
require("telescope").load_extension("media_files")
require("telescope").load_extension("node_modules")
