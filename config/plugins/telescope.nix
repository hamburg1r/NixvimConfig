{ config, lib, ... }: {
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        border = true;
        sorting_strategy = "ascending";
        layout_strategy = "flex";
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
          vertical = {
            prompt_position = "top";
          };
        };
      };
      pickers = {
        
      };
    };
    lazyLoad = {
      enable = true;
      settings = {
        event = "DeferredUIEnter";
      };
    };
  };

  plugins.web-devicons.enable = true;

}
