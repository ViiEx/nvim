local run = function()
	local mode = require("core.statusline.modules.mode")
	local filename = require("core.statusline.modules.filename")
	local branch = require("core.statusline.modules.branch")
	local diff = require("core.statusline.modules.diff")
	local diagnostics = require("core.statusline.modules.diagnostics")
	local lsp = require("core.statusline.modules.lsp")
	local copilot = require("core.statusline.modules.copilot")
	local tab = require("core.statusline.modules.tab")
	local progress = require("core.statusline.modules.progress")
	local location = require("core.statusline.modules.location")
	local nothing = require("core.statusline.modules.nothing")

	local a = table.concat({
		mode(),
		nothing(),
		filename(),
		nothing(),
		branch(),
		nothing(),
		diff(),
		nothing(),
		"%=",
		diagnostics(),
		lsp(),
		copilot(),
		nothing(),
		tab(),
		nothing(),
		progress(),
		nothing(),
		location(),
	})
	local b = table.concat({
		"%#Nothing2#" .. " ",
		"%=",
		mode(),
		nothing(),
		diagnostics(),
	})

	if vim.o.columns < 120 then
		return b
	else
		return a
	end
end

local setup = function()
	vim.opt.statusline = run()
	vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
		callback = function()
			vim.opt.statusline = run()
		end,
	})
end

return { run = run, setup = setup }
