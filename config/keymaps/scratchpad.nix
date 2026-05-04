{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Scratchpad keymaps (conditional Snacks or notifications)
  { key = "<leader>.o"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.scratch.open() end" else mkRaw "function() vim.notify('Snacks.scratch.open() not replaced, consider a dedicated scratchpad plugin', vim.log.levels.WARN) end"; options = { desc = "[O]pen Scratchpad"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>.s"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.scratch.select() end" else mkRaw "function() vim.notify('Snacks.scratch.select() not replaced, consider a dedicated scratchpad plugin', vim.log.levels.WARN) end"; options = { desc = "[S]elect Scratchpad"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
]
