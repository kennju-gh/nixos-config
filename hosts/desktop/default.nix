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
      my.home.reaper.enable = true;

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
    my.system.carla-yabridge.enable = true;
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
    my.system.audio = {
      enable = true;
      quantum = 512;
      minQuantum = 64;
      maxQuantum = 1024;
    };

    # Network
    my.system.tailscale.enable = true;

    # Service
    my.system.sunshine.enable = true;
    my.system.sunshine-stream.enable = true;
    my.system.wireplumber-disable-hdmi-dp = {
      enable = true;
      devices = [ "alsa_card.pci-0000_03_00.1" ]; # (wpctl status)
    };
  };
}
