{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<F5>"; action = mkRaw "function() require('dap').continue() end"; options = { desc = "Debug: Start/Continue"; }; plugin = "dap"; }
  { key = "<F10>"; action = mkRaw "function() require('dap').step_over() end"; options = { desc = "Debug: Step Over"; }; plugin = "dap"; }
  { key = "<F11>"; action = mkRaw "function() require('dap').step_into() end"; options = { desc = "Debug: Step Into"; }; plugin = "dap"; }
  { key = "<F12>"; action = mkRaw "function() require('dap').step_out() end"; options = { desc = "Debug: Step Out"; }; plugin = "dap"; }
  { key = "<leader>Bt"; action = mkRaw "function() require('dap').toggle_breakpoint() end"; options = { desc = "[T]oggle"; }; plugin = "dap"; }
  { key = "<leader>lp"; action = mkRaw "function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end"; options = { desc = "[P]oint"; }; plugin = "dap"; }
  { key = "<leader>dr"; action = mkRaw "function() require('dap').repl.open() end"; options = { desc = "[R]EPL"; }; plugin = "dap"; }
  { key = "<leader>dl"; action = mkRaw "function() require('dap').run_last() end"; options = { desc = "[L]ast Run"; }; plugin = "dap"; }
  { key = "<leader>Bc"; action = mkRaw "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end"; options = { desc = "[C]onditional"; }; plugin = "dap"; }
  { key = "<leader>dC"; action = mkRaw "function() require('dap').clear_breakpoints() end"; options = { desc = "[C]lear Breakpoints"; }; plugin = "dap"; }
  { key = "<leader>dt"; action = mkRaw "function() require('dap').terminate() end"; options = { desc = "[T]erminate"; }; plugin = "dap"; }
  { key = "<leader>dR"; action = mkRaw "function() require('dap').restart() end"; options = { desc = "[R]estart"; }; plugin = "dap"; }
  { key = "<leader>dc"; action = mkRaw "function() require('dap').run_to_cursor() end"; options = { desc = "[C]ursor"; }; plugin = "dap"; }
  { key = "<S-F11>"; action = mkRaw "function() require('dap').step_back() end"; options = { desc = "Debug: Step Back"; }; plugin = "dap"; }
  { key = "<S-F5>"; action = mkRaw "function() require('dap').reverse_continue() end"; options = { desc = "Debug: Reverse Continue"; }; plugin = "dap"; }
  { key = "<leader>du"; action = mkRaw "function() require('dapui').toggle() end"; options = { desc = "[U]I Toggle"; }; plugin = "dap"; }
  { key = "<leader>de"; action = mkRaw "function() require('dapui').eval() end"; options = { desc = "[E]val"; }; mode = [ "n" "v" ]; plugin = "dap"; }
  { key = "<leader>dh"; action = mkRaw "function() require('dap.ui.widgets').hover() end"; options = { desc = "[H]over"; }; mode = [ "n" "v" ]; plugin = "dap"; }
  { key = "<leader>dp"; action = mkRaw "function() require('dap.ui.widgets').preview() end"; options = { desc = "[P]review"; }; mode = [ "n" "v" ]; plugin = "dap"; }
  { key = "<leader>df"; action = mkRaw "function() local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.frames) end"; options = { desc = "[F]rames"; }; plugin = "dap"; }
  { key = "<leader>ds"; action = mkRaw "function() local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopes) end"; options = { desc = "[S]copes"; }; plugin = "dap"; }
]
