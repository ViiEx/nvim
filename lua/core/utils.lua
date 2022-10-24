local M = {}

local merge_tb = vim.tbl_deep_extend

M.user_terminals = {}

M.load_mappings = function(section, mapping_opt)
  local function set_section_map(section_values)
    if section_values.plugin then
      return
    end
    section_values.plugin = nil

    for mode, mode_values in pairs(section_values) do
      local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
      for keybind, mapping_info in pairs(mode_values) do
        -- merge default + user opts
        local opts = merge_tb("force", default_opts, mapping_info.opts or {})

        mapping_info.opts, opts.mode = nil, nil
        opts.desc = mapping_info[2]

        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end

  local mappings = require("core.mappings")

  if type(section) == "string" then
    mappings[section]["plugin"] = nil
    mappings = { mappings[section] }
  end

  for _, sect in pairs(mappings) do
    set_section_map(sect)
  end
end

M.toggle_term_cmd = function(term_details)
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(term_details) == "string" then term_details = { cmd = term_details, hidden = true } end
  -- use the command as the key for the table
  local term_key = term_details.cmd
  -- set the count in the term details
  if vim.v.count > 0 and term_details.count == nil then
    term_details.count = vim.v.count
    term_key = term_key .. vim.v.count
  end
  -- if terminal doesn't exist yet, create it
  if M.user_terminals[term_key] == nil then
    M.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
  end
  -- toggle the terminal
  M.user_terminals[term_key]:toggle()
end

return M
