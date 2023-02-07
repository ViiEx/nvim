/_ -- My NeoVim Configuration -- _/

# Neovim Config

## Introduction

This is my personal configuration of `neovim` with the `mappings` I'm more confurtable with
and the `plugins` I like and use everyday. I'll say it first, this config is not perfect by any means. It needs a lot of fixes \
and a lot of work but I am pretty happy with how it turned out up till now. I'm working on it almost daily and I change/fix a lot of stuff
that are either buggy **or** I don't like.

This configuration aims to be my daily IDE and contains configurations from many different amazing people such us:

- [The LunarVim project](https://github.com/LunarVim/LunarVim)
- [The NvChad project and it's extensions](https://github.com/NvChad/NvChad)
- [KrakeNvim](https://github.com/dharmx/nvim)
- [Lvim](https://github.com/lvim-tech/lvim)
- [OctoVim](https://github.com/OctoVim/OctoVim)
- And more that I'm probably forgetting.

I'm developing `web` and `mobile` apps daily so my configs are surrounding this part the most.

This configuration is always updating with new staff, fixes (it needs a few or many ٩(◕‿◕｡)۶) and features I steal... I mean borrowing from other people.

## Installation

Make sure you create a backup of your existing `NeoVim` config in case you already have one.

```sh
mv ~/.config/nvim ~/.config/nvim.back
```

Then run the following command.

```sh
git clone https://github.com/ViiEx/nvim.git ~/.config/nvim
```

## Features

There are many different banners taken from `KrakeNvim` that can be found at `./lua/core/banners.lua` and you can change with one you like to use by modding a single line at `./lua/plugins/config/alpha.lua`

```lua
-- ...

local default_header = {
	type = "text",
	val = require("core.banners")["krakedking"], -- <- Change the name here.
	opts = {
		position = "center",
		hl = "AlphaHeader",
		-- wrap = "overflow";
	},
}

-- ..
```

I'm using `NeoTree` instaed of the `NvimTree` cause I find it really fancy and of course `ToggleTerm` for the terminals.

Many standar plugins such as `Cmp`, `LspConfig`, `Mason`, `Null-ls`, `Lualine` and `Buffer Line`.

> Used to have `NvChad_ui` but it is a hustle to make it work properly here so I removed it.

The config includes by default `hovered diagnostics` cause they are so much more easier to read for me
so if you don't prefer it that way you can disable it
by commenting out the `autocmd` command in the file `./lua/autocmds.lua`

I have telescope with emojis enabled cause I like using them as well.

Finally I don't use `Which-key` since I remember my keybindings but you can easily install it to help you.

### Small guide to use Which-key

First install the plugin

```lua
-- ./lua/plugins/init.lua

{
  "folke/which-key.nvim",
  module = "which-key",
  keys = { "<leader>", '"', "'", "`" },
  config = function()
    require("plugins.config.which-key")
  end,
  init = function()
    require("core.utils").load_mappings "whichkey"
  end,
}

```

Create a config file at the following location: `./lua/plugins/config/which-key.lua` \
and add the following.

```lua
-- The following is taken from NvChad
local present, wk = pcall(require, "which-key")

if not present then
  return
end

local options = {

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "  ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "none", -- none/single/double/shadow
  },

  layout = {
    spacing = 6, -- spacing between columns
  },

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

wk.setup(options)
```

Add the keymappings to the `./lua/core/mappings.lua` file

```lua
-- Again config taken from NvChad
-- ....
M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}
-- ....
```

## Showcase

![Screenshot_2](./assets/Screenshot_from_2023-02-03_14-00-31.png)

![Screenshot_1](./assets/Screenshot_from_2023-02-03_14-01-59.png)

![Screenshot_1](./assets/Screenshot_from_2023-02-03_14-03-28.png)

![Screenshot_1](./assets/Screenshot_from_2023-02-03_14-26-35.png)
