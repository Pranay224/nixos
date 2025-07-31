{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./../../modules/system
  ];

  system.stateVersion = "24.11";
}
