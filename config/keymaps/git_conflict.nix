{ lib, ... }:
let
  mkRaw = lib.nixvim.mkRaw;
in
[
  { key = "<leader>gco"; action = "<Plug>(git-conflict-ours)"; options = { desc = "[O]urs"; }; plugin = "git_conflict"; }
  { key = "<leader>gct"; action = "<Plug>(git-conflict-theirs)"; options = { desc = "[T]heirs"; }; plugin = "git_conflict"; }
  { key = "<leader>gcb"; action = "<Plug>(git-conflict-both)"; options = { desc = "[B]oth"; }; plugin = "git_conflict"; }
  { key = "<leader>gc0"; action = "<Plug>(git-conflict-none)"; options = { desc = "[N]one"; }; plugin = "git_conflict"; }
  { key = "[x"; action = "<Plug>(git-conflict-prev-conflict)"; options = { desc = "Previous Conflict"; }; plugin = "git_conflict"; }
  { key = "]x"; action = "<Plug>(git-conflict-next-conflict)"; options = { desc = "Next Conflict"; }; plugin = "git_conflict"; }
]
