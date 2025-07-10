{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        fuzzy.prebuilt_binaries.download = true;

        keymap = {
          preset = "super-tab";
        };

        cmdline.completion.ghost_text.enabled = false;

        appearance.nerd_font_variant = "mono";

        signature.window = {
          border = "rounded";
          winhighlight = "Normal:CmpNormal";
        };

        completion = {
          ghost_text.enabled = false;
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
            window = {
              border = "rounded";
              winhighlight = "Normal:CmpNormal";
              scrollbar = false;
            };
          };
          menu = {
            border = "rounded";
            winhighlight = "Normal:CmpNormal";
            scrollbar = false;
          };
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
