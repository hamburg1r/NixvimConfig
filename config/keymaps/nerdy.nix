{ config, lib, mkRaw, ... }:

[
  {
    key = "<leader>;nn";
    action = mkRaw "function() require('telescope').extensions.nerdy.nerdy() end";
    mode = "n";
    options = {
      silent = true;
      desc = "Nerdy";
    };
    plugin = "nerdy";
  }
  {
    key = "<leader>;nr";
    action = mkRaw "function() require('telescope').extensions.nerdy.nerdy_recents() end";
    mode = "n";
    options = {
      silent = true;
      desc = "Nerdy Recents";
    };
    plugin = "nerdy";
  }
]
