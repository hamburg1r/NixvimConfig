{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # explorer keymaps
  { key = "<leader>te"; action = mkRaw "function() require('neo-tree.command').execute({ toggle = true, position = 'left' }) end"; options = { desc = "[E]xplorer (Neo-Tree)"; }; plugin = "neo-tree"; }
]
