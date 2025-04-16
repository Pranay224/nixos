{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      preConfig = ''
        local border = {
			    { "╭", "FloatBorder" },
			    { "─", "FloatBorder" },
			    { "╮", "FloatBorder" },
			    { "│", "FloatBorder" },
			    { "╯", "FloatBorder" },
			    { "─", "FloatBorder" },
			    { "╰", "FloatBorder" },
			    { "│", "FloatBorder" },
		    }

		    local handlers = {
			    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		    }

        vim.cmd([[ highlight DiagnosticVirtualTextWarn guibg=NONE ]])
        vim.cmd([[ highlight DiagnosticVirtualTextInfo guibg=NONE ]])
        vim.cmd([[ highlight DiagnosticVirtualTextError guibg=NONE ]])
        vim.cmd([[ highlight DiagnosticVirtualTextHint guibg=NONE ]])
        vim.cmd([[ highlight DiagnosticVirtualTextOk guibg=NONE ]])

        vim.diagnostic.config({
          virtual_text = {
            prefix = "●",
          },
          float = { border = border },
        })

      '';

      servers = {
        clangd = {
          enable = true;
          autostart = true;
          extraOptions = {
            handlers.__raw = "handlers";
          };
        };

        pyright = {
          enable = true;
          autostart = true;
          extraOptions = {
            handlers.__raw = "handlers";
          };
        };

        nil_ls = {
          enable = true;
          autostart = true;
          extraOptions = {
            handlers.__raw = "handlers";
          };
        };

        jdtls = {
          enable = true;
          autostart = true;
          extraOptions = {
            handlers.__raw = "handlers";
          };
        };

      };

      keymaps = {
        lspBuf = {
          gD = "declaration";
          gd = "definition";
          K = "hover";
          gi = "implementation";
        };
      };
    };
  };
}
