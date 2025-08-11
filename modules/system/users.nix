{ pkgs, ... }:

{
  users = {
    users.pranay = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
    defaultUserShell = pkgs.zsh;
  };
}
