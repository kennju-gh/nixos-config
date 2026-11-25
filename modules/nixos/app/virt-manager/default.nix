{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.virt-manager;
in
{
  options.my.system.virt-manager = {
    enable = lib.mkEnableOption "virt-manager";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
      };
    };

    virtualisation.spiceUSBRedirection.enable = true;
    programs.virt-manager.enable = true;

    environment.systemPackages = [
      pkgs.spice-gtk
    ];

    security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";

    networking.firewall.trustedInterfaces = [ "virbr0" ];

    systemd.services.libvirtd = {
      unitConfig.RequiresMountsFor = [ "/.vm" ];
      after = [ "systemd-tmpfiles-setup.service" ];
    };
  };
}
