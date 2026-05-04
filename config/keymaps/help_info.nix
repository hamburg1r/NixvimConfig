{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Help & Information Pickers
  { key = "<leader>;h"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.help() end" else mkRaw "function() require('telescope.builtin').help_tags() end"; options = { desc = "[H]elp"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>;r"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.registers() end" else mkRaw "function() require('telescope.builtin').registers() end"; options = { desc = "[R]egisters"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>;k"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.keymaps() end" else mkRaw "function() require('telescope.builtin').keymaps() end"; options = { desc = "[K]eymaps"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>;m"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.man() end" else mkRaw "function() require('telescope.builtin').man_pages() end"; options = { desc = "[M]an Pages"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>;u"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.undo() end" else mkRaw "function() require('telescope.builtin').undotree() end"; options = { desc = "[U]ndo"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>;/"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker() end" else mkRaw "function() require('telescope.builtin').builtin() end"; options = { desc = "[/]Pickers"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]