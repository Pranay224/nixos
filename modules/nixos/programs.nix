{
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    wireshark = {
      enable = true;
      dumpcap.enable = true;
    };
  };
  
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    tlp.enable = true;
  };
}
