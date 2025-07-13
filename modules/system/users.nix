{ pkgs, ... }:

{
  users = {
    users.pranay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "wireshark" "adbusers" ];
    };
    defaultUserShell = pkgs.zsh;
  };
}
