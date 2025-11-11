{
  home.username = "pranay";
  home.homeDirectory = "/home/pranay";

  imports = [
    ./alacritty.nix
    ./waybar.nix
    ./zsh.nix
    ./programs.nix
    ./git.nix
    ./rofi.nix
    ./theme.nix
    ./hyprland
    ./nvim
    ./direnv.nix
    ./btop.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
