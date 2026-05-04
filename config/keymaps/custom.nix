{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>'u"; action = mkRaw "function() CUSTOM.CustomFunctions.unicode_converter() end"; options = { desc = "Convert unicode to character"; }; mode = [ "n" "v" ]; plugin = "custom"; }
]
