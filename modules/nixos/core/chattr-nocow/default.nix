{ pkgs, username, ... }:
{
  systemd.services.chattr-nocow = {
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" ];
    before = [
      "docker.service"
      "podman.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    path = [
      pkgs.e2fsprogs
      pkgs.gawk
      pkgs.gnugrep
    ];
    script = ''
      for dir in /.steam /.wine /.vm /.podman /var/lib/docker /var/lib/containers/storage /home/${username}/.config/Ryujinx /home/${username}/.local/share/Steam /home/${username}/.local/share/containers/storage; do
        if [ -d "$dir" ] && [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
          if ! lsattr -d "$dir" 2>/dev/null | awk '{print $1}' | grep -q 'C'; then
            chattr +C "$dir"
          fi
        fi
      done
    '';
  };
}
