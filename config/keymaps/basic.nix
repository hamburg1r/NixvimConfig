{ ... }: [
  { key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; mode = [ "n" ]; plugin = "native"; }
  { key = "<C-[>"; action = "<cmd>nohlsearch<CR>"; mode = [ "n" ]; plugin = "native"; }
  { key = "<Esc><Esc>"; action = "<C-\\><C-n>"; options = { desc = "Exit terminal mode"; }; mode = [ "t" ]; plugin = "native"; }

  # Substitute
  # Without prefilled pattern
  { key = "gss"; action = ":%s///g<left><left><left>"; mode = [ "n" ]; options = { desc = "Substitute (no prefilled pattern)"; }; plugin = "native"; }
  { key = "gsS"; action = ":*s///g<left><left><left>"; mode = [ "n" ]; options = { desc = "Substitute (no prefilled pattern, visual selection)"; }; plugin = "native"; }
  # Word under cursor
  { key = "gsw"; action = ":%s/\\<<c-r><c-w>\\>//g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute word under cursor"; }; plugin = "native"; }
  { key = "gsW"; action = ":*s/\\<<c-r><c-w>\\>//g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute word under cursor (visual selection)"; }; plugin = "native"; }
  # Last search pattern
  { key = "gs/"; action = ":%s///g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute last search pattern"; }; plugin = "native"; }
  { key = "gs?"; action = ":*s///g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute last search pattern (buffer-local)"; }; plugin = "native"; }
  # From default register
  { key = "gs\""; action = ":%s/<c-r>\"//g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute from default register"; }; plugin = "native"; }
  { key = "gs*"; action = ":*s/<c-r>\"//g<left><left>"; mode = [ "n" ]; options = { desc = "Substitute from default register (buffer-local)"; }; plugin = "native"; }
  # Visually selected text
  { key = "gs"; action = "y:<c-u>%s/<c-r>\"//g<left><left>"; mode = [ "x" ]; options = { desc = "Substitute visually selected text"; }; plugin = "native"; }
]
