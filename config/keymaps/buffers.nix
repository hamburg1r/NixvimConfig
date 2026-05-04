{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Buffer Operations
  { key = "<leader>bs"; action = mkRaw "function() vim.cmd.write() end"; options = { desc = "[S]ave"; }; plugin = "native"; }
  { key = "<leader>ba"; action = mkRaw "function() vim.cmd.wall() end"; options = { desc = "Save [A]ll"; }; plugin = "native"; }
  { key = "<leader>by"; action = mkRaw "function() vim.cmd('%y *') end"; options = { desc = "[Y]ank"; }; plugin = "native"; }
  { key = "<leader>bdd"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.bufdelete.delete() end" else mkRaw "function() vim.cmd.bd() end"; options = { desc = "[D]elete Current"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>bda"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.bufdelete.all() end" else mkRaw "function() vim.cmd('%bd') end"; options = { desc = "Delete [A]ll"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>bdo"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.bufdelete.other() end" else mkRaw ''function() vim.cmd("silent! execute '%bdelete! | edit #'") end''; options = { desc = "Delete [O]ther"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }

  # Snacks Buffer Pickers
  { key = "<leader>bg"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lines() end" else mkRaw "function() require('telescope.builtin').live_grep() end"; options = { desc = "[G]rep"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>bG"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.grep_buffers() end" else mkRaw "function() require('telescope.builtin').live_grep() end"; options = { desc = "[G]rep All"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>b/"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.buffers() end" else mkRaw "function() require('telescope.builtin').buffers() end"; options = { desc = "Find [/]"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]
