{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Notifications
  { key = "<leader>'c"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.notifier.hide() end" else mkRaw "function() require('nvim-notify').dismiss() end"; options = { desc = "[C]lear"; }; plugin = if config.plugins.snacks.enable then "snacks" else "nvim-notify"; }
  { key = "<leader>'h"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.notifier.show_history() end" else mkRaw "function() require('nvim-notify').history() end"; options = { desc = "[H]istory"; }; plugin = if config.plugins.snacks.enable then "snacks" else "nvim-notify"; }
  { key = "<leader>'s"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.notifications() end" else mkRaw "function() require('telescope.builtin').notify() end"; options = { desc = "[S]how Picker"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]