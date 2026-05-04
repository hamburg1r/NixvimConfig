{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  # Generic toggles (conditional Snacks or native Neovim functions/fallbacks)
  { key = "<leader>tW"; action = if config.plugins.snacks.enable then mkRaw ''function() Snacks.toggle.option("wrap", { name = "Wrap" }) end'' else mkRaw "function() vim.opt.wrap = not vim.opt.wrap end"; options = { desc = "[W]rap"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tr"; action = if config.plugins.snacks.enable then mkRaw ''function() Snacks.toggle.option("relativenumber", { name = "Relative Number" }) end'' else mkRaw "function() vim.opt.relativenumber = not vim.opt.relativenumber end"; options = { desc = "[R]elative Number"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tl"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.line_number() end" else mkRaw "function() vim.opt.number = not vim.opt.number end"; options = { desc = "[L]ine Number"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tc"; action = if config.plugins.snacks.enable then mkRaw ''function() Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }) end'' else mkRaw "function() vim.opt.conceallevel = vim.opt.conceallevel:get() == 0 and 2 or 0 end"; options = { desc = "[C]onceallevel"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tD"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.diagnostics() end" else mkRaw "function() vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text }) end"; options = { desc = "[D]iagnostics (Toggle Virtual Text)"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tt"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.treesitter() end" else mkRaw "function() vim.notify('Snacks.toggle.treesitter() not replaced, consider a dedicated treesitter plugin config', vim.log.levels.WARN) end"; options = { desc = "[T]reesitter"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>ti"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.indent() end" else mkRaw "function() vim.notify('Snacks.toggle.indent() not replaced', vim.log.levels.WARN) end"; options = { desc = "[I]ndent"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>td"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.dim() end" else mkRaw "function() vim.notify('Snacks.toggle.dim() not replaced', vim.log.levels.WARN) end"; options = { desc = "[D]im"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tz"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.zoom() end" else mkRaw "function() vim.notify('Snacks.toggle.zoom() not replaced, consider a window management plugin', vim.log.levels.WARN) end"; options = { desc = "[Z]oom"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
  { key = "<leader>tZ"; action = if config.plugins.snacks.enable then mkRaw "function() Snacks.toggle.zen() end" else mkRaw "function() vim.notify('Snacks.toggle.zen() not replaced, consider zen-mode.nvim', vim.log.levels.WARN) end"; options = { desc = "[Z]en)"; }; plugin = if config.plugins.snacks.enable then "snacks" else "native"; }
]

