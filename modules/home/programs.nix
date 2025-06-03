{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Archiving utils
    zip
    unzip
    rar
    p7zip

    # Pentesting tools
    nmap
    sqlmap
    binwalk
    exiftool
    ripmime
    dig
    whois
    burpsuite
    aircrack-ng
    (john.overrideAttrs (old: {
       NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or "") + " -march=native";
     }))

    # Gaming utils
    steam-run

    # Office suite
    libreoffice

    # Shell utils
    tree
    ripgrep
    file
    feh
    neofetch
    usbutils

    # Common languages
    python3

    # qt theming
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    (catppuccin-kvantum.override {
     accent = "blue";
     variant = "mocha";
     })
  ];

  programs = {
    firefox.enable = true;
    bat.enable = true;
  };
}
