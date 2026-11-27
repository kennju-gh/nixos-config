{
  username,
  ...
}:
{
  # Data
  fileSystems."/mnt/DATA" = {
    device = "/dev/disk/by-label/DATA";
    fsType = "xfs";
    options = [
      "noatime"
      "nofail"
      "x-systemd.device-timeout=5s"
    ];
  };

  # VM
  fileSystems."/var/lib/libvirt/images" = {
    device = "/.vm";
    fsType = "none";
    options = [
      "bind"
      "noatime"
      "x-systemd.requires-mounts-for=/.vm"
      "x-systemd.requires-mounts-for=/var/lib/libvirt"
    ];
  };

  # Steam
  fileSystems."/home/${username}/.local/share/Steam" = {
    device = "/.steam";
    fsType = "none";
    options = [
      "bind"
      "noatime"
      "x-systemd.requires-mounts-for=/.steam"
      "x-systemd.requires-mounts-for=/home/${username}/.local/share"
    ];
  };

  # Podman rootless
  fileSystems."/home/${username}/.local/share/containers/storage" = {
    device = "/.podman";
    fsType = "none";
    options = [
      "bind"
      "noatime"
      "x-systemd.requires-mounts-for=/.podman"
      "x-systemd.requires-mounts-for=/home/${username}/.local/share/containers"
    ];
  };
}
