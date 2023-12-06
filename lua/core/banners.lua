local path = "core.banners."

local banners = {
	["angryskull"] = require(path .. "angryskull"),
	["hydra"] = require(path .. "hydra"),
	["krakedking"] = require(path .. "krakedking"),
	["sleekraken"] = require(path .. "sleekraken"),
	["pacman"] = require(path .. "pacman"),
	["threeskulls_v1"] = require(path .. "threeskulls_v1"),
	["threeskulls_big_v1"] = require(path .. "threeskulls_big_v1"),
	["areee??"] = require(path .. "areee??"),
	["uwu"] = require(path .. "uwu"),
	["butterfly"] = require(path .. "butterfly"),
	["cat"] = require(path .. "cat"),
	["pac_vim"] = require(path .. "pac_vim"),
	["anatomy_heart"] = require(path .. "anatomy_heart"),
	["anatomy_skull"] = require(path .. "anatomy_skull"),
	["atari"] = require(path .. "atari"),
	["doom"] = require(path .. "doom"),
	["saitama_ok"] = require(path .. "saitama_ok"),
	["nvim-chill"] = require(path .. "nvim-chill"),
}

return setmetatable(banners, {
	__index = function(logos, key)
		if key == "random" then
			local keys = vim.tbl_keys(logos)
			return logos[keys[math.random(1, #keys + 1)]]
		end
		return logos[key]
	end,
})
