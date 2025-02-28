{
  programs.nixvim = {
    plugins.web-devicons.enable = true;
    plugins.telescope = {
      enable = true;

      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
      };

      keymaps = {
        "<leader>fb" = {
          action = "file_browser path=%:p:h select_buffer=true<CR>";
          mode = "n";
          options.noremap = true;
        };

        "<leader>sr" = {
          action = "registers<CR>";
          mode = "n";
          options.noremap = true;
        };

        "<leader>ff" = {
          action = "find_files<CR>";
          mode = "n";
          options.noremap = true;
        };

        "<leader>gs" = {
          action = "live_grep<CR>";
          mode = "n";
          options.noremap = true;
        };
      };
    };
  };
}
