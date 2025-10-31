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
    netcat-gnu
    sqlmap
    binwalk
    exiftool
    ripmime
    dig
    whois
    ffuf
    amass
    crunch
    thc-hydra
    burpsuite
    aircrack-ng
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
    net-tools

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
    nix-index-database.comma.enable = true;
    nix-index.enableZshIntegration = false;

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };
  };
}
