{ config, pkgs, lib, ... }:

{
  plugins = {
    nix-develop = {
      enable = true;
    };
  };
}
