{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>ti"; action = mkRaw "function() vim.cmd('IndentBlanklineToggle') end"; options = { desc = "[I]ndent (Indent Blankline)"; }; plugin = "indent-blankline"; }
]
