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

  users.groups.adbusers.members = [ "pranay" ];
  users.groups.wireshark.members = [ "pranay" ];

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    getty = {
      autologinOnce = true;
      autologinUser = "pranay";
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    wl-clipboard
    wireshark
    openvpn
  ];
}
