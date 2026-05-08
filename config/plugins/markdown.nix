{ config, pkgs, lib, ... }:

{
  plugins = {
    render-markdown = {
      enable = false;
      lazyLoad = {
        enable = true;
        settings = {
          ft = [ "markdown" ];
        };
      };
    };
    markdown-preview = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings = {
          ft = [ "markdown" ];
        };
      };
    };
    markview = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings = {
          ft = [ "markdown" ];
        };
      };
    };
  };
}
