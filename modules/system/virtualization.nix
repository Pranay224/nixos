{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "pranay" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        swtpm.enable = true;
      };
    };
  };
}
