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
    ffuf
    crunch
    thc-hydra
    aircrack-ng
    gef
    radare2
    metasploit
    exploitdb
    (john.overrideAttrs (old: {
      NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or "") + " -march=native";
    }))

    # FHS compliance workaround
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
    nix-index

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

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };
  };
}
