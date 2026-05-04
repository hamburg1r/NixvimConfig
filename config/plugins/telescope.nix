{ config, lib, ... }:

{
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = { };
    };
  };

  plugins.web-devicons.enable = true;

}
