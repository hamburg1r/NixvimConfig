{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>'c"; action = mkRaw "function() require('notify').dismiss() end"; options = { desc = "[C]lear (Notify)"; }; plugin = "notify"; }
  { key = "<leader>'h"; action = mkRaw "function() require('notify').history() end"; options = { desc = "[H]istory (Notify)"; }; plugin = "notify"; }
]
