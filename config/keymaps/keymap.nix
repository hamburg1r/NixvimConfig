{ config, lib, stripPluginsAttribute, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
  basicKeymapDefinitions = import ./basic.nix { inherit config lib mkRaw; };
  togglesKeymapDefinitions = import ./toggles.nix { inherit config lib mkRaw; };
  scratchpadKeymapDefinitions = import ./scratchpad.nix { inherit config lib mkRaw; };
  buffersKeymapDefinitions = import ./buffers.nix { inherit config lib mkRaw; };
  gitKeymapDefinitions = import ./git.nix { inherit config lib mkRaw; };
  lspKeymapDefinitions = import ./lsp.nix { inherit config lib mkRaw; };
in
{
  config.keymaps =
    lib.filter (keymap: !(keymap ? plugin)) (stripPluginsAttribute {
      keymapsList =
        basicKeymapDefinitions ++
        buffersKeymapDefinitions ++
        gitKeymapDefinitions ++
        lspKeymapDefinitions ++
        scratchpadKeymapDefinitions ++
        togglesKeymapDefinitions;
      pluginsToStrip = [ "native" ];
    });
}
