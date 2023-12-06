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
	},
}

neorg.setup(options)
