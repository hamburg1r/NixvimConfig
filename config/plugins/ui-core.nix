{ config, pkgs, lib, ... }:

{
  colorscheme = "tokyonight-night";
  colorschemes.tokyonight.enable = true;
  plugins = {
    bufferline.enable = false;
    web-devicons.enable = true; # From bufferline.nix
    
    notify.enable = true;

    # noice = {
    #   enable = false;
    #   settings = {
    #     lsp = {
    #       override = {
    #         "vim.lsp.util.convert_input_to_markdown_lines" = true;
    #         "vim.lsp.util.stylize_markdown" = true;
    #       };
    #       signature = {
    #         enabled = false;
    #       };
    #     };
    #     presets = {
    #       bottom_search = true;
    #       command_palette = true;
    #       long_message_to_split = true;
    #       inc_rename = false;
    #       lsp_doc_border = true;
    #     };
    #   };
    # };
    # nui.enable = false;

    indent-blankline.enable = true;

    nvim-ufo.enable = true;

    image.enable = true;
  };
}
