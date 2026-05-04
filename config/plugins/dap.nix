{ config, pkgs, lib, ... }:

let
  mkRaw = lib.nixvim.mkRaw;
in
{
  plugins = {
    dap = {
      enable = true;
      adapters = {
        executables = {
          dart = {
            command = "dart";
            args = [ "debug_adapter" ];
          };
          flutter = {
            command = "flutter";
            args = [ "debug_adapter" ];
          };
        };
      };
      configurations = {
        dart = [
          {
            type = "dart";
            request = "launch";
            name = "Launch Dart Program";
            program = "\${file}"; # Need to verify if ${file} is accessible or needs a different variable
            cwd = "\${workspaceFolder}"; # Same here
            args = [ ];
            console = "terminal";
          }
          {
            type = "dart";
            request = "launch";
            name = "Launch Dart Program (with args)";
            program = "\${file}";
            cwd = "$\{workspaceFolder}";
            args = mkRaw ''
              function()
                local input = vim.fn.input("Enter args: ")
                return vim.split(input, " ", true)
              end
            '';
            console = "terminal";
          }
        ];
        flutter = [
          {
            type = "flutter";
            request = "launch";
            name = "Launch Flutter App";
            cwd = "\${workspaceFolder}";
            program = "lib/main.dart";
            toolArgs = [ "-d" "chrome" ];
          }
          {
            type = "flutter";
            request = "launch";
            name = "Launch Flutter App (Debug Mode)";
            cwd = "\${workspaceFolder}";
            program = "lib/main.dart";
            toolArgs = [ "--debug" ];
          }
          {
            type = "flutter";
            request = "launch";
            name = "Launch Flutter App (Profile Mode)";
            cwd = "\${workspaceFolder}";
            program = "lib/main.dart";
            toolArgs = [ "--profile" ];
          }
          {
            type = "flutter";
            request = "launch";
            name = "Launch Flutter App (Device Selection)";
            cwd = "\${workspaceFolder}";
            program = "lib/main.dart";
            toolArgs = mkRaw ''
              function()
                  local devices = vim.fn.systemlist("flutter devices --machine 2>/dev/null")
                  if #devices == 0 then
                      vim.notify("No Flutter devices found", vim.log.levels.WARN)
                      return {}
                  end
                  local device_options = {}
                  for _, device_json in ipairs(devices) do
                      local ok, device = pcall(vim.fn.json_decode, device_json)
                      if ok and device.id then
                          table.insert(device_options, {
                              id = device.id,
                              name = device.name or device.id,
                              display = device.id .. " (" .. (device.name or "Unknown") .. ")"
                          })
                      end
                  end
                  if #device_options == 0 then
                      vim.notify("No valid Flutter devices found", vim.log.levels.WARN)
                      return {}
                  end
                  local display_options = { "Select device:" }
                  for i, device in ipairs(device_options) do
                      table.insert(display_options, i .. ". " .. device.display)
                  end
                  local choice = vim.fn.inputlist(display_options)
                  if choice > 0 and choice <= #device_options then
                      local selected_device = device_options[choice]
                      return { "-d", selected_device.id }
                  end
                  return {}
              end
            '';
          }
          {
            type = "flutter";
            request = "attach";
            name = "Attach to Flutter Process";
            cwd = "\${workspaceFolder}";
          }
        ];
      };
      # Other dap settings can go here if needed.
    };

    dap-ui = {
      enable = true;
      # The setup function and listeners
      luaConfig.post = ''
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({}) -- No specific options were set in Lua, so empty table.
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
      '';
    };

    dap-virtual-text = {
      enable = true;
      # Default setup is just require("nvim-dap-virtual-text").setup(), so no explicit settings needed.
    };
  };
}
