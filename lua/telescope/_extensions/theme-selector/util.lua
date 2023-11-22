local M = {}
local _utils = {}

local entry_display = require("telescope.pickers.entry_display")

function _utils.capitalize(item)
	return (item:gsub("%a", string.upper, 1))
end

function M.make_entry(theme, opts)
	local name_table = vim.split(theme, "_", { plain = true })
	if #name_table < 3 then
		table.insert(name_table, 1, "single")
	end

	local background = name_table[#name_table]
	local category = name_table[1]
	local name = vim.list_slice(name_table, 2, #name_table - 1)

	return {
		name = table.concat(vim.tbl_map(_utils.capitalize, name), " "),
		category = category:upper(),
		background = background:upper(),
		highlights = {
			background = opts.highlights.background[background],
			category = opts.highlights.pack[category],
			name = opts.highlights.name,
		},
	}
end

function M.entries(opts)
	local themes = require("core.color-themes")

	return {
		results = themes,
		entry_maker = function(entry)
			local displayer = entry_display.create({
				seperator = opts.separator,
				item = {
					{ width = 0.2 },
					{ width = 0.2 },
					{ width = 0.4 },
					{ remaining = true },
				},
			})

			local item = M.make_entry(entry, opts)
			return {
				value = entry,
				display = function()
					return displayer({
						{ item.background, item.highlights.background },
						{ item.category, item.highlights.category },
						{ item.name, item.highlights.name },
					})
				end,
				ordinal = ("%s %s %s"):format(item.category, item.background, item.name),
			}
		end,
	}
end

return M
