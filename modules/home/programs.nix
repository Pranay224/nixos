{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Desktop utils
    grim
    slurp
    brightnessctl

    # Archiving utils
    zip
    unzip
    rar
    p7zip

    # Office suite
    libreoffice

    # Shell utils
    tree
    file
    btop

    # Common languages
    python3

    # qt theming libraries
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  programs = {
    firefox.enable = true;
    bat.enable = true;
  };
}
