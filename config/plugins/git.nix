{ config, lib, ... }:

{
  plugins = {
    gitsigns = {
      enable = true;
    };

    neogit = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings.cmd = "Neogit";
      };
    };
  };
}
