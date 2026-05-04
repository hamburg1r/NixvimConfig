{ config, pkgs, lib, stripPluginsAttribute, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
  # Get all .nix files in the keymaps directory except keymap.nix itself
  keymapFiles = builtins.filter (name: name != "keymap.nix" && lib.hasSuffix ".nix" name) (builtins.attrNames (builtins.readDir ../keymaps) );

  # Dynamically import all keymap definitions
  allKeymapDefinitions = lib.concatLists (lib.map (file: import (../keymaps + "/${file}") { inherit config lib mkRaw; }) keymapFiles);
in
{
  plugins.lz-n = {
    enable = true;
    keymaps = lib.filter (keymap: keymap ? plugin) (stripPluginsAttribute {
      keymapsList = allKeymapDefinitions;
      pluginsToStrip = [ "native" ];
    });
  };

  plugins.lzn-auto-require = {
    enable = true;
  };
}
