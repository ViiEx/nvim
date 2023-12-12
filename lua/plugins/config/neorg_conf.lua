local status_ok, neorg = pcall(require, "neorg")

if not status_ok then
	return
end

local options = {
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "~/neorg/Work",
					personal = "~/neorg/Personal",
				},
			},
		},
		["core.mode"] = {},
		["core.highlights"] = {},
		["core.dirman.utils"] = {},
		["core.ui"] = {},
		["core.qol.toc"] = {},
		["core.clipboard.code-blocks"] = {},
		["core.esupports.hop"] = {},
		["core.esupports.indent"] = {},
		["core.esupports.metagen"] = {},
		["core.autocommands"] = {},
		["core.integrations.treesitter"] = {},
		["core.itero"] = {},
		["core.qol.todo_items"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.export"] = {},
		["core.export.markdown"] = { config = { extensions = "all" } },
		["core.summary"] = {},
	},
}

neorg.setup(options)
