{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>cdf"; action = mkRaw "vim.diagnostic.open_float"; options = { desc = "[F]loat"; }; plugin = "native"; }
  { key = "<leader>cgd"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_definitions() end" else mkRaw "function() require('telescope.builtin').lsp_definitions() end"; options = { desc = "[D]efinition"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cgr"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_references() end" else mkRaw "function() require('telescope.builtin').lsp_references() end"; options = { desc = "[R]eferences"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cgi"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_implementations() end" else mkRaw "function() require('telescope.builtin').lsp_implementations() end"; options = { desc = "[I]mplementation"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cgt"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_type_definitions() end" else mkRaw "function() require('telescope.builtin').lsp_type_definitions() end"; options = { desc = "[T]ype Definition"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cgs"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_symbols() end" else mkRaw "function() require('telescope.builtin').lsp_document_symbols() end"; options = { desc = "Document [S]ymbols"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cgw"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_workspace_symbols() end" else mkRaw "function() require('telescope.builtin').lsp_workspace_symbols() end"; options = { desc = "[W]orkspace Symbols"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cga"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_declarations() end" else mkRaw "function() require('telescope.builtin').lsp_declarations() end"; options = { desc = "Decl[A]ration"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cr"; action = mkRaw "vim.lsp.buf.rename"; options = { desc = "[C]ode: [R]ename"; }; plugin = "native"; }
  { key = "<leader>ca"; action = mkRaw "function() require('actions-preview').code_actions() end"; options = { desc = "[C]ode [A]ction"; }; mode = [ "n" "x" ]; plugin = "actions-preview"; }
  { key = "<leader>ch"; action = mkRaw "vim.lsp.buf.hover"; options = { desc = "[C]ode: [H]over"; }; plugin = "native"; }
  { key = "K"; action = mkRaw "vim.lsp.buf.hover"; options = { desc = "Hover"; }; plugin = "native"; }
  { key = "<leader>lcc"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_config() end" else mkRaw "function() vim.notify('LSP Config picker is unavailable with current configuration.', vim.log.levels.WARN) end"; options = { desc = "[L]SP [C]onfig"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>lci"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_incoming_calls() end" else mkRaw "function() require('telescope.builtin').lsp_incoming_calls() end"; options = { desc = "[L]SP [C]alls [I]ncoming"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>lco"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.lsp_outgoing_calls() end" else mkRaw "function() require('telescope.builtin').lsp_outgoing_calls() end"; options = { desc = "[L]SP [C]alls [O]utgoing"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }

  # Diagnostics
  { key = "<leader>cdt"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.diagnostics() end" else mkRaw "function() require('telescope.builtin').diagnostics() end"; options = { desc = "[T]otal List"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>cdb"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.diagnostics_buffer() end" else mkRaw "function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end"; options = { desc = "[B]uffer List"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]
