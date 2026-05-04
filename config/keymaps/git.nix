{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Git Operations
  { key = "<leader>go"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.lazygit.open() end" else mkRaw "function() vim.notify('Snacks.lazygit.open() not replaced, consider a dedicated lazygit integration', vim.log.levels.WARN) end"; options = { desc = "[O]pen LazyGit"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>gb"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_branches() end" else mkRaw "function() require('telescope.builtin').git_branches() end"; options = { desc = "[B]ranch"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>gd"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_diff() end" else mkRaw "function() require('telescope.builtin').git_diff_files() end"; options = { desc = "[D]iff"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>gl"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_log() end" else mkRaw "function() require('telescope.builtin').git_commits() end"; options = { desc = "[L]og"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>gL"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_log_file() end" else mkRaw "function() require('telescope.builtin').git_file_history() end"; options = { desc = "[L]og File"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>g<c-l>"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_log_line() end" else mkRaw "function() vim.notify('Snacks.picker.git_log_line() not replaced, no direct telescope equivalent for line history', vim.log.levels.WARN) end"; options = { desc = "Log [L]ine"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>gs"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_status() end" else mkRaw "function() require('telescope.builtin').git_status() end"; options = { desc = "[S]tatus"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>gS"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.git_stash() end" else mkRaw "function() require('telescope.builtin').git_stash() end"; options = { desc = "[S]tash"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]