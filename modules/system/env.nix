{ lib, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = lib.mkForce true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.pam.services.hyprlock = { };
}
