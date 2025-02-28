{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;

    clipboard.providers.wl-copy.enable = true;

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        pattern = "*";
        callback.__raw = "vim.lsp.buf.format";
      }
    ];

    performance = { 
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
      };

      combinePlugins.enable = true;
    };
  };

  imports = [
    ./theme.nix
    ./lualine.nix
    ./remaps.nix
    ./opts.nix
    ./treesitter.nix
    ./extra.nix
    ./noice.nix
    ./telescope.nix
    ./conform.nix
    ./lsp.nix
    ./rust.nix
    ./cmp.nix
  ];
}
