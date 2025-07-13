{ pkgs, ... }:

{
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    adb.enable = true;

    wireshark = {
      enable = true;
      dumpcap.enable = true;
    };
  };

  services = {
    tlp.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    wl-clipboard
    wireshark
  ];
}
