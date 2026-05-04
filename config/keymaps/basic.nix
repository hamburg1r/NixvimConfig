{ ... }: [
  { key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; plugin = "native"; }
  { key = "<C-[>"; action = "<cmd>nohlsearch<CR>"; plugin = "native"; }
  { key = "<Esc><Esc>"; action = "<C-\><C-n>"; options = { desc = "Exit terminal mode"; }; mode = [ "t" ]; plugin = "native"; }
]
