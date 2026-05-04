{ config, lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "]c"; action = mkRaw ''
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require('gitsigns').nav_hunk('next')
        end
      end
    ''; options = { desc = "Go to next diff hunk"; }; plugin = "gitsigns"; }
  { key = "[c"; action = mkRaw ''
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require('gitsigns').nav_hunk('prev')
        end
      end
    ''; options = { desc = "Go to previous diff hunk"; }; plugin = "gitsigns"; }
  { key = "<leader>ghs"; action = mkRaw "function() require('gitsigns').stage_hunk() end"; options = { desc = "[S]tage"; }; plugin = "gitsigns"; }
  { key = "<leader>ghr"; action = mkRaw "function() require('gitsigns').reset_hunk() end"; options = { desc = "[R]eset"; }; plugin = "gitsigns"; }
  { key = "<leader>ghs"; action = mkRaw ''function() require('gitsigns').stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end''; options = { desc = "[S]tage"; }; mode = [ "v" ]; plugin = "gitsigns"; }
  { key = "<leader>ghr"; action = mkRaw ''function() require('gitsigns').reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end''; options = { desc = "[R]eset"; }; mode = [ "v" ]; plugin = "gitsigns"; }
  { key = "<leader>ghS"; action = mkRaw "function() require('gitsigns').stage_buffer() end"; options = { desc = "[S]tage Buffer"; }; plugin = "gitsigns"; }
  { key = "<leader>ghR"; action = mkRaw "function() require('gitsigns').reset_buffer() end"; options = { desc = "[R]eset Buffer"; }; plugin = "gitsigns"; }
  { key = "<leader>ghp"; action = mkRaw "function() require('gitsigns').preview_hunk() end"; options = { desc = "[P]review"; }; plugin = "gitsigns"; }
  { key = "<leader>ghi"; action = mkRaw "function() require('gitsigns').preview_hunk_inline() end"; options = { desc = "[I]nline Preview"; }; plugin = "gitsigns"; }
  { key = "<leader>ghb"; action = mkRaw "function() require('gitsigns').blame_line({ full = true }) end"; options = { desc = "[B]lame Line (Full)"; }; plugin = "gitsigns"; }
  { key = "<leader>ghd"; action = mkRaw "function() require('gitsigns').diffthis() end"; options = { desc = "[D]iff Current File"; }; plugin = "gitsigns"; }
  { key = "<leader>ghD"; action = mkRaw "function() require('gitsigns').diffthis('~') end"; options = { desc = "[D]iff Last Commit"; }; plugin = "gitsigns"; }
  { key = "<leader>ghQ"; action = mkRaw "function() require('gitsigns').setqflist('all') end"; options = { desc = "[Q]uickfix All"; }; plugin = "gitsigns"; }
  { key = "<leader>ghq"; action = mkRaw "function() require('gitsigns').setqflist() end"; options = { desc = "[Q]uickfix Current"; }; plugin = "gitsigns"; }
  { key = "<leader>tb"; action = mkRaw "function() require('gitsigns').toggle_current_line_blame() end"; options = { desc = "[B]lame Current Line"; }; plugin = "gitsigns"; }
  { key = "<leader>tw"; action = mkRaw "function() require('gitsigns').toggle_word_diff() end"; options = { desc = "[W]ord Diff Highlighting"; }; plugin = "gitsigns"; }
  { key = "ih"; action = mkRaw "function() require('gitsigns').select_hunk() end"; options = { desc = "Select hunk (text object)"; }; mode = [ "o" "x" ]; plugin = "gitsigns"; }
]
