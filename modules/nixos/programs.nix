{
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };
  
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    tlp.enable = true;
  };
}
