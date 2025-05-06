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

    extraConfigLua = ''
      require('lz.n').load {
        {
          'rainbow',
            event = { "BufReadPre", "BufNewFile" },
        },
        {
          'auto-pairs',
            event = { "BufReadPre", "BufNewFile" },
        },
        {
          'vim-commentary',
            event = { "BufReadPre", "BufNewFile" },
        },
        {
          'cmp-under-comparator',
            event = { "BufReadPre", "BufNewFile" },
        }
      }
    '';
  };
}
