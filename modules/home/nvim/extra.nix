{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs; [
      vimPlugins.auto-pairs 
      vimPlugins.rainbow
      vimPlugins.cmp-under-comparator
      vimPlugins.vim-commentary
      vimPlugins.plenary-nvim
    ];
  };
}
