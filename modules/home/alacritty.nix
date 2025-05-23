{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 20.0;
  
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
  
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
  
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
  
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
  
        offset = {
          x = 0;
          y = 0;
        };
      };
  
      window = {
        padding = {
          x = 0;
          y = 0;
        };
  
        dynamic_padding = true;
      };
  
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
        };
  
        cursor = {
          text = "#1E1E2E";
          cursor = "#F5E0DC";
        };
  
        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };
  
        search = {
          matches = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
          focused_match = {
            foreground = "#1E1E2E";
            background = "#A6E3A1";
          };
        };
  
        footer_bar = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
  
        hints = {
          start = {
            foreground = "#1E1E2E";
            background = "#F9E2AF";
          };
          end = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };
  
        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };
  
        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
  
        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
  
        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
  
        indexed_colors = [
          { index = 16; color = "#FAB387"; }
          { index = 17; color = "#F5E0DC"; }
        ];
      };
    };
  };
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
