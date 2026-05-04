{ config, pkgs, lib, ... }:

{
  # Testing related plugins
  plugins = {
    coverage = {
      enable = true;
    };

    neotest = {
      enable = true;
      # No specific settings from Lua config were found for the base neotest plugin.
      # Any future configuration can be added here.
      # For example, to enable a specific adapter, it would look like:
      # adapters.dart.enable = true;
    };
  };
}
