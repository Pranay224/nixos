{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/system
  ];

  system.stateVersion = "24.11";
}
