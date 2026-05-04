{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # lazygit / git keymaps
  { key = "<leader>go"; action = mkRaw "function() require('neogit').open() end"; options = { desc = "[O]pen Neogit"; }; plugin = "neogit"; }
]
