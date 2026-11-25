{
  pkgs,
  ...
}:
{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = [
    pkgs.dnsmasq
    pkgs.spice-gtk
  ];

  security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";

  networking.firewall.trustedInterfaces = [ "virbr0" ];

  systemd.services.libvirtd = {
    unitConfig.RequiresMountsFor = [ "/.vm" ];
    after = [ "systemd-tmpfiles-setup.service" ];
  };

  systemd.services.libvirt-default-network = {
    after = [ "libvirtd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = "root";
      ExecStart = pkgs.writeShellScript "libvirt-default-network-start" ''
        set -euo pipefail
        ${pkgs.libvirt}/bin/virsh net-autostart default
        if ! ${pkgs.libvirt}/bin/virsh net-info default 2>/dev/null | grep -q "Active:.*yes"; then
          ${pkgs.libvirt}/bin/virsh net-start default
        fi
      '';

      ExecStop = pkgs.writeShellScript "libvirt-default-network-stop" ''
        if ${pkgs.libvirt}/bin/virsh net-info default 2>/dev/null | grep -q "Active:.*yes"; then
          ${pkgs.libvirt}/bin/virsh net-destroy default
        fi
      '';
    };
  };
}
