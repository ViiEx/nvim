local utils = require('core.utils')

require('options')
require('autocmds')
require('plugins')

utils.load_mappings("general", { buffer = bufnr })
