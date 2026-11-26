{
  username,
  ...
}:
{
  imports = [
    ./hardware.nix
    ../common/filesystems.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  config = {

    # == User modules (Home Manager)
    # -- Enable user-level features here:

    home-manager.users.${username} = {

      # Backup
      my.home.rsync.enable = true;

      # Browser
      my.home.firefox.enable = true;

      # CLI
      my.home.btop.enable = true;
      my.home.diskwatch.enable = true;
      my.home.fastfetch.enable = true;
      my.home.neovim.enable = true;
      my.home.nvtop.enable = true;
      my.home.yazi.enable = true;

      # Desktop
      my.home.fuzzel.enable = true;
      my.home.gtk.enable = true;
      my.home.hypridle = {
        enable = true;
        lock.enable = true;
        timeouts = {
          lock = 180;
          monitorOff = 200;
          suspend = 420;
        };
      };
      my.home.hyprlock.enable = true;
      my.home.mako.enable = true;
      my.home.nautilus-dconf.enable = true;
      my.home.niri = {
        enable = true;
        profile = "laptop";
      };
      my.home.qt.enable = true;
      my.home.swaybg.enable = true;
      my.home.tomat.enable = true;
      my.home.waybar = {
        enable = true;
        # output = "???";
        # hwmon = {
        #   cpu = "???";
        #   gpu = "???";
        # };
      };
      my.home.wl-clip-persist.enable = true;
      my.home.wlogout.enable = true;

      # Device
      my.home.ios.enable = true;

      # DevOps
      my.home.vscode.enable = true;

      # Document
      my.home.libreoffice-qt.enable = false; # temporarily disabled
      my.home.obsidian.enable = true;
      my.home.qalculate-gtk.enable = true;
      my.home.zathura.enable = true;

      # Gaming
      my.home.obs.enable = false; # disabled

      # Guitar
      my.home.carla.enable = false; # disabled
      my.home.reaper.enable = false; # disabled
      my.home.yabridge.enable = false; # disabled

      # Media
      my.home.coppwr.enable = true;
      my.home.foliate.enable = true;

      # Security
      my.home.gpg.enable = true;

      # Shell

      # System
      my.home.xdg-dir.enable = true;
      my.home.xdg-mime = {
        enable = true;
        book = true;
        browser = true;
        dev = true;
        file-manager = true;
        media = true;
        office = false; # temporarily disabled
        pdf = true;
        wine = false; # disabled
      };
      my.home.xwayland-satellite.enable = true;

      # Windows
      my.home.wine-prefix.enable = false; # disabled
    };

    # == System modules (NixOS)
    # -- Enable system-level features here:

    # App
    my.system.virt-manager.enable = false; # disabled
    my.system.wine.enable = false; # disabled

    # Hardware
    my.system.logind.enable = true;
    my.system.pipewire = {
      enable = true;
      minQuantum = 512;
      maxQuantum = 2048;
    };
    my.system.pipewire-jack.enable = false; # disabled
    my.system.wireplumber-disable-hdmi-dp.enable = false; # disabled

    # Network
    my.system.tailscale.enable = false; # disabled

    # Service
    my.system.sunshine.enable = false; # disabled
    my.system.sunshine-stream.enable = false; # disabled
  };
}
