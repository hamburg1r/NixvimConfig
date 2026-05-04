{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Explorer Picker
  { key = "<leader>te"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.explorer() end" else "<CMD>Neotree<CR>"; options = { desc = "[E]xplorer"; }; plugin = if config.plugins.snacks.enable then "snacks" else "neo-tree"; }
]
