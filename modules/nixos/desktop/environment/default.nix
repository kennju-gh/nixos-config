{ pkgs, ... }:
{
  environment.pathsToLink = [ "share/thumbnailers" ];

  # File manager support
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.usbmuxd.enable = true;
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };

  # Monitor support
  hardware.i2c.enable = true;

  # Security & Secrets
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.dconf.enable = true;
  services.dbus = {
    enable = true;
    packages = with pkgs; [
      gcr_4
      gnome-keyring
    ];
  };

  # Journal
  services.journald.settings.Journal = {
    SystemMaxUse = "1G";
    MaxRetentionSec = "14day";
  };

  # Variables
  environment.sessionVariables = {
    # Session variables
    SSH_AUTH_SOCK = "\${XDG_RUNTIME_DIR}/keyring/ssh";
    GTK_A11Y = "none";
    NO_AT_BRIDGE = "1";

    # Wayland variables
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    MOZ_ENABLE_WAYLAND = "1";

    # Telegram
    TDESKTOP_USE_GTK_FILE_DIALOG = 1;
  };

  # Disable unnecessary services
  services.printing.enable = false;
  services.avahi.enable = false;

  # Disable conflicting gcr-ssh-agent
  systemd.user.services.gcr-ssh-agent.enable = false;
  systemd.user.sockets.gcr-ssh-agent.enable = false;

  # Trim & BIOS
  services.fstrim.enable = true;
  services.fwupd.enable = true;
}
