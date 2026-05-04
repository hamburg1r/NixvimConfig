{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>cfb"; action = mkRaw "function() require('flutter-bloc').create_bloc() end"; options = { desc = "[B]loc"; }; plugin = "flutter_bloc"; }
  { key = "<leader>cfc"; action = mkRaw "function() require('flutter-bloc').create_cubit() end"; options = { desc = "[C]ubit"; }; plugin = "flutter_bloc"; }
  { key = "<leader>cf;"; action = mkRaw "function() require('telescope.builtin').commands({ default_text = 'flutter ' }) end"; options = { desc = "[;]Commands"; }; plugin = "flutter_bloc"; }
]
