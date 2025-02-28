{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs; [ vimPlugins.rust-tools-nvim ];
    extraConfigLua = ''
      local rt = require("rust-tools")
      local opts = {
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      }
      rt.setup(opts)
    '';
  };
}
