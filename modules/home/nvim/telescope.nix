{
  programs.nixvim = {
    plugins.web-devicons.enable = true;
    plugins.lz-n.enable = true;
    plugins.telescope = {
      enable = true;

      lazyLoad.settings.cmd = "Telescope";

      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
      };

      keymaps = {
        "<leader>fb" = {
          action = "file_browser path=%:p:h select_buffer=true";
          mode = "n";
          options.noremap = true;
        };

        "<leader>sr" = {
          action = "registers";
          mode = "n";
          options.noremap = true;
        };

        "<leader>ff" = {
          action = "find_files";
          mode = "n";
          options.noremap = true;
        };

        "<leader>gs" = {
          action = "live_grep";
          mode = "n";
          options.noremap = true;
        };
      };
    };
  };
}
