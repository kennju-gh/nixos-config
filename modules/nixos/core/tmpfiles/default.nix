{ username, ... }:
{
  systemd.tmpfiles.rules = [
    # Docker
    "d /var/lib/docker 0711 root root - -"

    # Podman
    "d /var/lib/containers/storage 0700 root root - -"

    # Libvirt
    "d /var/lib/libvirt 0755 root root - -"
    "d /var/lib/libvirt/images 0755 root root - -"

    # Subvolumes
    "d /.podman 0700 ${username} users - -"
    "d /.steam 0770 ${username} users - -"
    "d /.wine 0770 ${username} users - -"
    "d /.vm 0755 root libvirtd - -"

    # Steam & Podman-rootless
    "d /home/${username}/.local 0755 ${username} users - -"
    "d /home/${username}/.local/share 0755 ${username} users - -"
    "d /home/${username}/.local/share/Steam 0770 ${username} users - -"
    "d /home/${username}/.local/share/containers 0700 ${username} users - -"
    "d /home/${username}/.local/share/containers/storage 0700 ${username} users - -"
  ];
}
