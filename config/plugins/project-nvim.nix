{ ... }: {
  plugins.project-nvim = {
    # Disabled: corrupts its history file and errors on buffer delete
    enable = false;
    enableTelescope = true;
    settings = {
      enable_autochdir = true;
      scope_chdir = "tab";
      different_owners = {
        allow = true;
      };
      telescope = {
        mappings = {
          i = {
            "<C-n>" = false;
            "<C-;>" = "rename_project";
          };
        };
      };
    };
  };
}
