{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>ca"; action = mkRaw "function() require(\"tiny-code-action\").code_action() end"; options = { noremap = true; silent = true; desc = "[A]ction"; }; plugin = "tiny_code_action"; }
]
