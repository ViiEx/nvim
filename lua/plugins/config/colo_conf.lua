local status_ok, colo = pcall(require, "colo")

if not status_ok then
	return
end

local opts = {
	theme = "radium_dark",
	reload = {
		enable = true,
		items = {
			"colo.groups",
			{ "colo.extensions.feline", import = true },
			-- { "plugins.config.feline_conf", import = true },
			-- { "plugins.config.buffer-line", import = true },
			-- { "plugins.config.aplha", import = true },
		},
	},
}

colo.setup(opts)
