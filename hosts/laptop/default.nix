{
  username,
  pkgs,
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
        lockScreen = true;
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
      my.home.ansible.enable = true;
      my.home.gh.enable = true;
      my.home.git.enable = true;
      my.home.glab.enable = true;
      my.home.go.enable = true;
      my.home.json-yaml.enable = true;
      my.home.just.enable = true;
      my.home.kubernetes.enable = true;
      my.home.lazydocker.enable = true;
      my.home.lazygit.enable = true;
      my.home.lint.enable = true;
      my.home.mosh.enable = true;
      my.home.python.enable = true;
      my.home.terraform.enable = true;
      my.home.trivy.enable = true;
      my.home.vscode.enable = true;

      # Document
      my.home.libreoffice-qt.enable = false; # temporarily disabled
      my.home.obsidian.enable = true;
      my.home.qalculate-gtk.enable = true;
      my.home.zathura.enable = true;

      # Gaming
      my.home.mangohud.enable = true;
      my.home.obs-studio.enable = false; # disabled
      my.home.mesa-demos.enable = true;
      my.home.pince.enable = true;
      my.home.qbittorrent.enable = true;

      # Guitar
      my.home.carla.enable = false; # disabled
      my.home.reaper.enable = false; # disabled
      my.home.yabridge.enable = false; # disabled

      # Media
      my.home.coppwr.enable = true;
      my.home.foliate.enable = true;
      my.home.imv.enable = true;
      my.home.kid3-qt.enable = false; # disabled
      my.home.mpd.enable = true;
      my.home.mpv.enable = true;
      my.home.rmpc.enable = true;
      my.home.spectral-mic.enable = true;

      # Messenger
      my.home.telegram-desktop.enable = true;
      my.home.webcord.enable = false; # disabled

      # Security
      my.home.gpg.enable = true;
      my.home.keepassxc.enable = true;

      # Shell
      my.home.direnv.enable = true;
      my.home.fzf.enable = true;
      my.home.kitty.enable = true;
      my.home.starship.enable = true;
      my.home.tmux.enable = true;
      my.home.zoxide.enable = true;
      my.home.zsh.enable = true;

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
    my.system.docker.enable = true;
    my.system.nautilus.enable = true;
    my.system.steam.enable = true;
    my.system.virt-manager.enable = false; # disabled
    my.system.wine.enable = false; # disabled

    #Core
    my.system.boot.enable = true;
    my.system.chattr-nocow.enable = true;
    my.system.kernel = {
      enable = true;
      packages = pkgs.linuxPackages_latest;
      modules = [
        "msr"
        "ntsync"
      ];
    };
    my.system.locale = {
      enable = true;
      timeZone = "Europe/Moscow";
      defaultLocale = "en_US.UTF-8";
      keyMap = "us";
    };
    my.system.nix = {
      enable = true;
      # stateVersion = "26.05"; # set to current NixOS release at initial install
    };
    my.system.oomd.enable = true;
    my.system.package.enable = true;
    my.system.swap.enable = true;

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
