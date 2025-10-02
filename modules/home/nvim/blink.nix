{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        fuzzy.prebuilt_binaries.download = true;
        keymap.preset = "super-tab";
        cmdline.completion.ghost_text.enabled = false;
        appearance.nerd_font_variant = "mono";

        completion = {
          ghost_text.enabled = false;
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
            window.scrollbar = false;
          };
          menu.scrollbar = false;
        };

        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };
  };
}
