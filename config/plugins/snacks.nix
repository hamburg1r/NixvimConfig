{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    plugins.snacks = {
      enable = false;

      settings = {
        bigfile.enable = true;
        dashboard.enable = false;
        dim.enable = true;
        explorer.enable = true;
        git.enable = true;
        gitbrowse.enable = true;
        image.enable = true;
        indent = {
          enable = true;
          only_current = true;
          animate.enable = true;
          chunk.enable = false;
          scope = {
            enable = true;
            underline = true;
          };
        };
        input.enable = true;
        lazygit.enable = true;
        notifier = {
          enable = true;
          timeout = 3000;
        };
        picker = {
          enable = true;
          layout = {
            cycle = true;
            preset = lib.nixvim.literalLua "function() return vim.o.columns >= 120 and \"default\" or \"dropdown\" end";
          };
          sources = {
            explorer = {
              layout = {
                layout = {
                  width = 30;
                };
              };
            };
            projects = {
              dev = [ "~/repo" ];
              patterns = [ ".git" "package.json" "pubspec.yaml" "flake.nix" ];
            };
          };
          win = {
            input = {
              keys = {
                "<c-u>" = "{ 'preview_scroll_up', mode = { 'i', 'n' } }";
                "<c-d>" = "{ 'preview_scroll_down', mode = { 'i', 'n' } }";
                "<c-f>" = "{ 'list_scroll_down', mode = { 'i', 'n' } }";
                "<c-b>" = "{ 'list_scroll_up', mode = { 'i', 'n' } }";
              };
            };
          };
        };
        quickfile.enable = true;
        scope.enable = true;
        scratch.enable = true;
        scroll.enable = false;
        statuscolumn.enable = true;
        words.enable = true;
        styles.notification = { };
      };



      # luaConfig.content = ''
      #   vim.api.nvim_create_autocmd("User", {
      #     pattern = "VeryLazy",
      #     callback = function()
      #       -- Setup some globals for debugging (lazy-loaded)
      #       _G.dd = function(...)
      #         Snacks.debug.inspect(...)
      #       end
      #       _G.bt = function()
      #         Snacks.debug.backtrace()
      #       end
      #       vim.print = _G.dd -- Override print to use snacks for `:=` command
      #     end,
      #   })
      # '';
    };
  };
}
