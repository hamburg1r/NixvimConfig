{ pkgs, ... }:

{
  # Enable none-ls plugin
  plugins.none-ls = {
    enable = true;

    sources = {
      code_actions = {
        gitrebase.enable = true;
        gitsigns.enable = true;
        refactoring.enable = true;
        # statix.enable = true;
      };

      diagnostics = {
        checkstyle.enable = true;
        commitlint.enable = true;
        deadnix.enable = true;
        editorconfig_checker.enable = true;
        markdownlint_cli2.enable = true;
        # statix.enable = true;
        todo_comments.enable = true;
        trail_space.enable = true;
      };

      formatting = {
        alejandra.enable = true;
        cbfmt.enable = true;
        clang_format.enable = true;
        cmake_format.enable = true;
        dart_format.enable = true;
        mdformat.enable = true;
        prettierd = {
          enable = true;
          settings = {
            filetypes = [ "markdown" ];
          };
        };
      };

      hover = {
        dictionary.enable = true;
      };
    };
  };
}
