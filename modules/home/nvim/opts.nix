{
  programs.nixvim = {
    opts = {
      guicursor = "";

      nu = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      smartindent = true;

      wrap = false;

      swapfile = true;
      backup = false;
      undofile = true;

      hlsearch = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      scrolloff = 10;
      signcolumn = "number";
      winborder = "rounded";

      updatetime = 50;
    };
  };
}
