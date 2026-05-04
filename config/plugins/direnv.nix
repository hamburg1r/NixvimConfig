{ ... }:

{
  plugins.direnv.enable = true;
  # The original Lua config had: lazy = false
  # This is usually handled by Nixvim's integration, but if not,
  # it might need to be configured as a lazyLoad option.
}
