{ pkgs, ... }: {
  lsp = {
    servers = {
      lua_ls = {
        enable = true;
        package = null;
      };

      basedpyright = {
        enable = true;
        package = null;
      };

      ts_ls = {
        enable = true;
        package = null;
      };

      ccls = {
        enable = true;
        package = null;
      };

      jdtls = {
        enable = false;
        package = null;
      };

      nixd = {
        enable = true;
        package = null;
      };
    };
  };

  plugins = {
    lspconfig = {
        enable = true;
    };

    java = {
        enable = true;
        settings.spring_boot_tools.enable = true;
    };
    spring-boot = {
      enable = true;
    };
  };
}
