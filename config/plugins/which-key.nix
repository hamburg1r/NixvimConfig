{ config, lib, ... }:

{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "[B]uffer";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "[C]ode";
        }
        {
          __unkeyed-1 = "<leader>cg";
          group = "[G]oto";
        }
        {
          __unkeyed-1 = "<leader>cb";
          group = "[B]loc";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "[D]ebug";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "[F]ind";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "[G]it";
        }
        {
          __unkeyed-1 = "<leader>gh";
          group = "[H]unk";
        }
        {
          __unkeyed-1 = "<leader>gc";
          group = "[C]onflict";
        }

        {
          __unkeyed-1 = "<leader>l";
          group = "[L]SP";
        }
        {
          __unkeyed-1 = "<leader>lc";
          group = "[C]alls";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "[T]oggle";
        }
        {
          __unkeyed-1 = "<leader>.";
          group = "[.]Scratchpad";
        }
        {
          __unkeyed-1 = "<leader>;";
          group = "[;]Picker";
        }
        {
          __unkeyed-1 = "<leader>;n";
          group = "[N]erdy";
        }
        {
          __unkeyed-1 = "<leader>'";
          group = "N[o]tify";
        }
      ];
    };
  };
}
