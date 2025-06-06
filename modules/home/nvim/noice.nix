{
  programs.nixvim = {
    plugins.noice = {
      enable = true;
      lazyLoad.settings.event = [ "BufWinEnter" ];

      settings = {
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = true;
        };

        lsp = {
          hover.enabled = false;
          signature.enabled = false;
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
					  "vim.lsp.util.stylize_markdown" = true;
					  "cmp.entry.get_documentation" = true;
          };
        };
      };
    };
  };
}
