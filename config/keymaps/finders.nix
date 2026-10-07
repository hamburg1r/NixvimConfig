{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # File and Project Finders/Pickers
  { key = "<leader>ff"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.files() end" else mkRaw "function() require('telescope.builtin').find_files() end"; options = { desc = "[F]iles"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>fg"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.grep() end" else mkRaw "function() require('telescope.builtin').live_grep() end"; options = { desc = "[G]rep"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  # Needs snacks, or telescope plus project-nvim's telescope extension
  { key = "<leader>fp"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.projects() end" else if config.plugins.telescope.enable && config.plugins."project-nvim".enable then mkRaw "function() require('telescope').extensions.projects.projects() end" else mkRaw "function() vim.notify('No project picker available, enable snacks or telescope + project-nvim', vim.log.levels.WARN) end"; options = { desc = "[P]rojects"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>fr"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.recent() end" else mkRaw "function() require('telescope.builtin').oldfiles() end"; options = { desc = "[R]ecent"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
  { key = "<leader>f:"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.picker.commands() end" else mkRaw "function() require('telescope.builtin').commands() end"; options = { desc = "[:]Command"; }; plugin = if config.plugins.snacks.enable then "snacks" else "telescope"; }
]
