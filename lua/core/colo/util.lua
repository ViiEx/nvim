local M = {}

M.list = {}

function M.list.rmbool(opts)
	if opts then
		opts[true] = nil
		opts[false] = nil
	end
	return opts
end

function M.list.sum(list)
	local sum = 0
	for _, item in pairs(list) do
		sum = sum + item
	end
	return sum
end

function M.list.list2boolmap(opts)
	for index, value in ipairs(opts) do
		opts[index] = nil
		opts[value] = true
	end
	return opts
end

M.line = {}

function M.line.capitalize(item)
	return (item:gsub("%a", string.upper, 1))
end

function M.line.ltrim(item)
	return (item:gsub("^%s*", ""))
end

function M.line.rtrim(item)
	local len = #item
	while len > 0 and item:find("^%s", len) do
		len = len - 1
	end
	return item:sub(1, len)
end

M.plugin = {}

return M
