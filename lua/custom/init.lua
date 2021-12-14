-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad
local hooks = require "core.hooks"
--require('custom.plugin-manager.PlugVim')
-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`
--
--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   --    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
   map("n", "<Down>", "<C-w>j", { noremap = true })
   map("n", "<Up>", "<C-w>k", { noremap = true })
   map("n", "<Left>", "<C-w>h", { noremap = true })
   map("n", "<Right>", "<C-w>l", { noremap = true })

   --Buffer mappings
   map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
   map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
   map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
   map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
   map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
   map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
   map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
   map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
   map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
   map("n", "<leader>b<Left>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
   map("n", "<leader>b<Right>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

   -- Terminal map

   map("t", "<ESC>", "<C-\\><C-n>")
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   -- use {
   --    "max397574/better-escape.nvim",
   --    event = "InsertEnter",
   -- }
   use {
      "williamboman/nvim-lsp-installer",
   }
   use {
      "folke/which-key.nvim",
      config = function()
         require "custom.plugins.whichkey"
      end,
   }

   use {
      "folke/trouble.nvim",
      config = function()
         require("trouble").setup {}
      end,
   }

   use {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
   }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
