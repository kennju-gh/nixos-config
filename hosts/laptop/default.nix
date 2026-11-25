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
      my.home.obs.enable = false; # temporarily disabled

      # Guitar
      my.home.carla.enable = false; # temporarily disabled
      my.home.reaper.enable = false; # temporarily disabled
      my.home.yabridge.enable = false; # temporarily disabled

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
        wine = false; # temporarily disabled
      };
      my.home.xwayland-satellite.enable = true;

      # Windows
      my.home.wine-prefix.enable = false; # temporarily disabled
    };

    # == System modules (NixOS)
    # -- Enable system-level features here:

    # Hardware
    my.system.audio = {
      enable = true;
      minQuantum = 256;
      maxQuantum = 2048;
    };
    my.system.logind.enable = true;
  };
}
