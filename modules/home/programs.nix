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

    # Pentesting tools
    nmap
    sqlmap
    binwalk
    exiftool
    ripmime
    dig
    whois

    # Office suite
    libreoffice

    # Shell utils
    tree
    ripgrep
    file
    feh
    neofetch
    (btop.overrideAttrs (oldAttrs: let
      themeFile = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_mocha.theme";
        sha256 = "0i263xwkkv8zgr71w13dnq6cv10bkiya7b06yqgjqa6skfmnjx2c";
      };
    in {
      postPatch = ''
        mkdir -p $out/share/btop/themes
        cp ${themeFile} $out/share/btop/themes
      '';
      doCheck = false;
    }))

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
