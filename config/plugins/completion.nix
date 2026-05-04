{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkOption types;
  cfg = config.plugins;
  mkRaw = lib.nixvim.mkRaw;
in
{
  plugins = {
    blink-cmp = {
      enable = true;
      # event = "InsertEnter"; # Nixvim handles lazy loading implicitly for most cases
      settings = {
        snippets.preset = "luasnip";
        # sources.providers.avante = {
        #   name = "Avante";
        #   opts = {};
        # };
        completion.accept.auto_brackets.enabled = true;
        completion.accept.dot_repeat = true;
        completion.accept.create_undo_point = true;
        completion.list.selection.auto_insert = true;
        completion.menu.auto_show = true;
        completion.menu.draw.columns = [
          { __unkeyed-1 = "kind_icon"; }
          { __unkeyed-1 = "label"; label_description = true; gap = 1; }
          { __unkeyed-1 = "kind"; }
        ];
        completion.menu.draw.treesitter = [ "lsp" ];
        completion.documentation.auto_show = true;
        completion.documentation.auto_show_delay_ms = 250;
        completion.documentation.window.border = "rounded";
        fuzzy.implementation = "prefer_rust_with_warning"; # Assuming rust environment
        appearance.nerd_font_variant = "mono"; # Assuming nerd font is available
        signature.enabled = true;
        keymap = {
          preset = "none";
          "<C-a>" = [ "show" "show_documentation" "hide_documentation" ];
          "<C-c>" = [ "hide" "fallback" ];
          "<C-y>" = [ "select_and_accept" ];
          "<C-p>" = [ "select_prev" "fallback" ];
          "<C-n>" = [ "select_next" "fallback" ];
          "<Tab>" = [ "snippet_forward" "fallback" ];
          "<S-Tab>" = [ "snippet_backward" "fallback" ];
          "<C-u>" = [ (mkRaw "function(cmp) cmp.scroll_documentation_up(1) end") ];
          "<C-d>" = [ (mkRaw "function(cmp) cmp.scroll_documentation_down(1) end") ];
          "<C-k>" = [ "show_signature" "hide_signature" "fallback" ];
        };
        cmdline.enabled = false;
      };
    };
  };
}
