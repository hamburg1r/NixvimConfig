{ config, pkgs, lib, stripPluginsAttribute, mcphub-nvim, inputs, ... }: # Add pkgs and inputs to arguments
{
  nixpkgs = {
    source = inputs.nixpkgs.path;
  };
  # Import all your configuration modules here
  imports = [
    ./plugins
    ./dependencies.nix
    ./options.nix
    ./lib/keymaps.nix
    (import ./keymaps/keymap.nix { inherit config lib stripPluginsAttribute; })
  ];
}
