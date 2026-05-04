{ lib, ... }:
let
  stripPluginsAttribute = { keymapsList, pluginsToStrip ? [] }:
    let
      # Conditionally remove the 'plugin' attribute
      transformKeymap = keymap:
        if keymap ? plugin && (lib.elem keymap.plugin pluginsToStrip) then
          lib.removeAttrs keymap [ "plugin" ]
        else
          keymap;
    in
    lib.map transformKeymap keymapsList;

in {
  # Expose the function for use in other modules
  _module.args.stripPluginsAttribute = stripPluginsAttribute;
}
