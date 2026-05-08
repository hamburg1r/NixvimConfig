{ config, lib, ... }:

{
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = { };
    lazyLoad = {
      enable = true;
      settings = {
        event = "DeferredUIEnter";
      };
    };
  };

  plugins.web-devicons.enable = true;

}
