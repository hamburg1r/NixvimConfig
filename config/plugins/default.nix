{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./actions-preview.nix
    ./ai.nix
    ./autopairs.nix
    ./completion.nix
    ./dap.nix

    ./direnv.nix
    ./flutter.nix
    ./git.nix
    ./lsp.nix
    ./lz-n.nix
    ./markdown.nix
    ./mini.nix
    ./neo-tree.nix
    ./nix.nix
    ./none-ls.nix
    ./oil.nix
    ./project-nvim.nix
    ./snacks.nix
    ./telescope.nix
    ./testing.nix
    ./treesitter.nix
    ./ui-core.nix
    ./utils.nix
    ./which-key.nix
  ];

  plugins.java = {
    enable = true;
    settings.spring_boot_tools.enable = false;
  };
}
