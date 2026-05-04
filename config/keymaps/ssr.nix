{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>cR"; action = mkRaw ''function() require("ssr").open() end''; options = { desc = "Structural search and replace"; }; mode = [ "n" "x" "v" ]; plugin = "ssr"; }
]
