{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;

      luaConfig.pre = ''
        local luasnip = require("luasnip")
      '';

      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];

      settings = {
        formatting = {
          format = /* lua */ ''
            function(entry, vim_item)
              local label = vim_item.abbr
              local truncated_label = vim.fn.strcharpart(label, 0, 20)
              if truncated_label ~= label then
                vim_item.abbr = truncated_label .. '...'
              elseif string.len(label) < 20 then
                local padding = string.rep(" ", 20 - string.len(label))
                vim_item.abbr = label .. padding
                end
                return vim_item
            end,
          '';
        };

        window = {
          completion = { border = "rounded"; winhighlight = "Normal:CmpNormal"; };
          documentation = { border = "rounded"; winhighlight = "Normal:CmpNormal"; };
        };

        snippet = {
          expand = /* lua */''
            function(args)
					    luasnip.lsp_expand(args.body)
				    end,
          '';
        };

        view.entries = { name = "custom"; selection_order = "near_cursor"; };

        mapping = {
          "<Tab>" = /* lua */ ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                  cmp.confirm()
                else
                  cmp.confirm()
                end
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<Down>" = /* lua */ "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<Up>" = /* lua */ "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
        };
      };
    };
  };
}
