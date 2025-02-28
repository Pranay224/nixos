{ pkgs, ... }:

{
  home = {
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 32;
    };
    sessionVariables = {
      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "Catppuccin Mocha";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 24;
    };

    theme = {
      package = pkgs.catppuccin-gtk.override { variant = "mocha"; };
      name = "catppuccin-mocha-blue-standard";
    };
  };
}
