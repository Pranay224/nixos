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

    docker = {
      enable = true;
      storageDriver = "btrfs";

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
