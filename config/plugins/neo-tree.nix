{ config, lib, ... }: let
  inherit (lib.nixvim) mkRaw;
in {
  plugins = {
    neo-tree = {
      enable = true;
      settings = {
        enable_git_status = true;
        enable_diagnostics = true;
        filesystem = {
          follow_current_file = {
            enabled = true;
          };
        };
        buffers = {
          follow_current_file = {
            enabled = true;
          };
        };
        window = {
          position = "right";
          auto_expand_width = true;
          mappings = {
            h = mkRaw ''
              function(state)
                local node = state.tree:get_node()
                if node.type == 'directory' and node:is_expanded() then
                  require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                else
                  require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
                end
              end
            '';
            l = mkRaw ''
              function(state)
                local node = state.tree:get_node()
                if node.type == 'directory' then
                  if not node:is_expanded() then
                    require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                  elseif node:has_children() then
                    require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                  end
                else
                  require'neo-tree.sources.filesystem.commands'.open(state)
                end
              end
            '';
          };
        };
        sources = [
          "filesystem"
          "buffers"
          # "tests"
          "document_symbols"
        ];
        source_selector = {
          winbar = true;
          sources = [
            { source = "filesystem"; }
            { source = "git_status"; }
            # { source = "tests"; }
            { source = "document_symbols"; }
            { source = "netman.ui.neo-tree"; }
          ];
        };
      };
    };
    netman = {
      enable = true;
      neoTreeIntegration = true;
    };
  };
}
