{ config, pkgs, lib, ... }:

{
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      have_nerd_font = true;
      # python_recommended_style = false;
    };

    opts = rec {
      number = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 100;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 5;
      sidescrolloff = 15;
      autoindent = true;
      expandtab = true;
      smarttab = true;
      tabstop = 4;
      shiftwidth = tabstop;
      softtabstop = tabstop;
      shiftround = true;
      showmatch = true;
      hlsearch = true;
      incsearch = true;
      display = [
        "lastline"
        "uhex"
      ];
      encoding = "utf-8";
      linebreak = true;
      # sidescrolloff = 5;
      wrap = true;
      # history = 1000;
      foldenable = false;
      foldmethod = "expr";
      foldcolumn = "1";
      termguicolors = true;
      dir = lib.nixvim.mkRaw "vim.fn.expand '~/.cache/nvim/swaps/'";
      undodir = lib.nixvim.mkRaw "vim.fn.expand '~/.cache/nvim/undodir/'";
      confirm = true;
      laststatus = 3;
      winborder = "rounded";
    };

    clipboard.register = "unnamedplus";
  };
}
