{ username, ... }:
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
        lock.enable = false;
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
        profile = "desktop";
      };
      my.home.qt.enable = true;
      # my.home.swaybg.enable = true;
      # my.home.tomat.enable = true;
      # my.home.waybar.enable = true;
      # my.home.wl-clip-persist.enable = true;
      # my.home.wlogout.enable = true;

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
      my.home.obs.enable = true;

      # Guitar
      my.home.carla.enable = true;
      my.home.reaper.enable = true;
      my.home.yabridge.enable = true;

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
        wine = true;
      };
      my.home.xwayland-satellite.enable = true;

      # Windows
      my.home.wine-prefix.enable = true;
    };

    # == System modules (NixOS)
    # -- Enable system-level features here:

    # App
    my.system.virt-manager.enable = true;
    my.system.wine.enable = true;

    # Core
    boot.kernelParams = [
      # amdgpu params are kept commented for debugging reference.
      # "amdgpu.dcdebugmask=0x410"
      # "amdgpu.no_vpe_idle_pg=1"
      # "amdgpu.runpm=0"
      "amdgpu.gpu_recovery=1" # reset GPU after a hang instead of requiring reboot.
      "video=HDMI-A-1:2560x1440@120"
      "video=DP-2:1920x1080@60"
    ];
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "coretemp" ];

    # Hardware
    my.system.logind.enable = false;
    my.system.pipewire = {
      enable = true;
      minQuantum = 256;
      maxQuantum = 2048;
    };
    my.system.pipewire-jack = {
      enable = true;
      quantum = 256;
      rate = 48000;
    };
    my.system.wireplumber-disable-hdmi-dp = {
      enable = true;
      devices = [ "alsa_card.pci-0000_03_00.1" ]; # (wpctl status)
    };

    # Network
    my.system.tailscale.enable = true;

    # Service
    my.system.sunshine.enable = true;
    my.system.sunshine-stream.enable = true;
  };
}
