{ config, pkgs, lib, stripPluginsAttribute, mcphub-nvim, ... }: # Add pkgs to arguments
{
  # Import all your configuration modules here
  imports = [
    ./plugins
    ./dependencies.nix
    ./options.nix
    ./lib/keymaps.nix
    (import ./keymaps/keymap.nix { inherit config lib stripPluginsAttribute; })
  ];
}
