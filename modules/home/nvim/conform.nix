{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      lazyLoad.settings.event = [ "BufReadPre" "BufNewFile" ];

      settings = {
        formatters = {
          clang-format = { command = "${pkgs.clang-tools}/bin/clang-format"; };
          isort = { command = "${pkgs.isort}/bin/isort"; };
          black = { command = "${pkgs.black}/bin/black"; };
        };

        formatters_by_ft = {
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          python = [ "isort" "black" ];
        };

        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
  };
}
