{ config, pkgs, lib, inputs, mcphub-nvim, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
  cfg = config.plugins;
  mkRaw = lib.nixvim.mkRaw;
  system = pkgs.stdenv.hostPlatform.system;
in {
  extraPackages = [ inputs.mcp-hub.packages."${system}".default ];
  extraPlugins = [ inputs.mcphub-nvim.packages.${system}.default ];
  extraConfigLua = ''
    require("mcphub").setup()
  '';

  plugins = {
    luasnip = {
      enable = true;
      filetypeExtend = {
        javascriptreact = [ "html" ];
      };
      # The build step for jsregexp is typically handled by the Nix package itself.
      # If not, it might need an override or extraPackages.
      # Assuming default Nixvim luasnip package includes necessary build.
    };

    codecompanion = {
      enable = true;
      settings = {
        interactions = {
          chat.adapter = "gemini_cli";
          inline.adapter = "gemini_cli";
          cmd.adapter = "gemini_cli";
        };
        adapters = {
          acp = {
            gemini_cli = mkRaw ''
              function()
                return require("codecompanion.adapters").extend("gemini_cli", {
                  defaults = {
                    auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                    timeout = 50000, -- 50 seconds
                  },
                  commands = {
                    default = { "${lib.getExe pkgs.gemini-cli}", "--experimental-acp" },
                  },
                })
              end
            '';
          };
        };
        opts.log_level = "DEBUG";
      };
    };
  };
}
