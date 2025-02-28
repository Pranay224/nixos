{
  programs.nixvim = {
    globals.mapleader = " ";
    
    keymaps = [
      {
	key = "<leader>pv";
	mode = "n";
	action = "<cmd>Ex<CR>";
      }
      {
        key = "<leader>of";
        mode = "n";
        action.__raw = "vim.diagnostic.open_float";
      }
    ];
  };  
}
