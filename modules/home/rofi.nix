{ config, pkgs, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-run = " Run ";
    };

    theme = {
      "*" = {
         bg-col = mkLiteral "#1e1e2e";
         bg-col-light = mkLiteral "#1e1e2e";
         border-col = mkLiteral "#1e1e2e";
         selected-col = mkLiteral "#1e1e2e";
         blue = mkLiteral "#89b4fa";
         fg-col = mkLiteral "#cdd6f4";
         fg-col2 = mkLiteral "#f38ba8";
         grey = mkLiteral "#6c7086";
         width = 600;
         font = "FiraCode Nerd Font 14";
      };
      
      "element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      
      "element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      
      "mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      
      "window" = {
        height = 360;
        border = 3;
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };
      
      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };
      
      "inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "@bg-col";
        border-radius = 5;
        padding = 2;
      };
      
      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = 6;
        text-color = mkLiteral "@bg-col";
        border-radius = 3;
        margin = mkLiteral "20px 0px 0px 20px";
      };
      
      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
      };
      
      "entry" = {
        padding = 6;
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };
      
      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 1;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };
      
      "element" = {
        padding = 5;
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };
      
      "element-icon" = {
        size = 25;
      };
      
      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@fg-col2";
      };
      
      "mode-switcher" = {
        spacing = 0;
      };
      
      "button" = {
        padding = 10;
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };
      
      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };
      
      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = 2;
        padding = 2;
        border-radius = 5;
      };
      
      "textbox" = {
        padding = 6;
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
  };
}
