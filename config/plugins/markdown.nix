{ config, pkgs, lib, ... }:

{
  plugins = {
    render-markdown = {
      enable = true;
      # You can add configuration options for render-markdown here if needed
      # settings = {
      #   debounce = 100; # Example setting
      #   enabled = true; # Example setting
      # };
    };
    markdown-preview.enable = true;
    markview.enable = true;
  };
}
