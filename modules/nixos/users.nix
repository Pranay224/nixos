{ pkgs, ... }:

{
  users = {
    users.pranay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "wireshark" ];
    };
    defaultUserShell = pkgs.zsh;
  };
}
