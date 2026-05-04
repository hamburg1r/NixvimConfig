{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>td"; action = mkRaw "function() require('dim').toggle() end"; options = { desc = "[D]im (Dim.nvim)"; }; plugin = "dim"; }
]
