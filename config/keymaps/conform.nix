{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>lf"; action = mkRaw "function() require('conform').format { async = true, lsp_format = 'fallback' } end"; options = { desc = "[F]ormat"; }; mode = [ "n" ]; plugin = "conform"; }
]
