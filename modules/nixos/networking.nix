{
  networking = {
    hostName = "cypher";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  time.timeZone = "Asia/Kolkata";
}
