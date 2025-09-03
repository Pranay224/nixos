{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Archiving utils
    zip
    unzip
    rar
    p7zip

    # FHS compliance workaround
    steam-run

    # Office suite
    libreoffice

    # Pentesting tools
    nmap
    sqlmap
    binwalk
    exiftool
    ripmime
    dig
    whois
    ffuf
    crunch
    thc-hydra
    burpsuite
    aircrack-ng
    gef
    radare2
    metasploit
    exploitdb
    responder-patched
    john-optimized
    python3Packages.impacket

    # Shell utils
    tree
    ripgrep
    file
    feh
    neofetch
    usbutils
    nix-index
    comma

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
