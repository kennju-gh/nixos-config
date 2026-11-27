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
      my.home.rsync.enable = false; # disabled

      # Browser
      my.home.firefox.enable = true;

      # CLI
      my.home.btop.enable = true;
      my.home.diskwatch.enable = true;
      my.home.fastfetch.enable = true;
      my.home.neovim.enable = false; # disabled
      my.home.nvtop.enable = true;
      my.home.yazi.enable = false; # disabled

      # Desktop
      my.home.fuzzel.enable = true;
      my.home.gtk.enable = true;
      my.home.hypridle = {
        enable = true;
        lockScreen = false; # disabled
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
        profile = "console";
      };
      my.home.qt.enable = true;
      my.home.swaybg.enable = true;
      my.home.tomat.enable = false; # disabled
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
      my.home.ios.enable = false; # disabled

      # DevOps
      my.home.ansible.enable = false; # disabled
      my.home.gh.enable = false; # disabled
      my.home.git.enable = true;
      my.home.glab.enable = false; # disabled
      my.home.go.enable = false; # disabled
      my.home.json-yaml.enable = false; # disabled
      my.home.just.enable = false; # disabled
      my.home.kubernetes.enable = false; # disabled
      my.home.lazydocker.enable = false; # disabled
      my.home.lazygit.enable = false; # disabled
      my.home.lint.enable = false; # disabled
      my.home.mosh.enable = false; # disabled
      my.home.python.enable = false; # disabled
      my.home.terraform.enable = false; # disabled
      my.home.trivy.enable = false; # disabled
      my.home.vscode.enable = false; # disabled

      # Document
      my.home.libreoffice-qt.enable = false; # disabled
      my.home.obsidian.enable = false; # disabled
      my.home.qalculate-gtk.enable = false; # disabled
      my.home.zathura.enable = false; # disabled

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
      my.home.coppwr.enable = false; # disabled
      my.home.foliate.enable = false; # disabled
      my.home.imv.enable = true;
      my.home.kid3-qt.enable = false; # disabled
      my.home.mpd.enable = true;
      my.home.mpv.enable = true;
      my.home.rmpc.enable = true;
      my.home.spectral-mic.enable = false; # disabled

      # Messenger
      my.home.telegram-desktop.enable = false; # disabled
      my.home.webcord.enable = false; # disabled

      # Security
      my.home.gpg.enable = true;
      my.home.keepassxc.enable = false; # disabled

      # Shell
      my.home.direnv.enable = false; # disabled
      my.home.fzf.enable = true;
      my.home.kitty.enable = true;
      my.home.starship.enable = true;
      my.home.tmux.enable = false; # disabled
      my.home.zoxide.enable = true;
      my.home.zsh.enable = true;

      # System
      my.home.xdg-dir.enable = true;
      my.home.xdg-mime = {
        enable = true;
        book = false; # disabled
        browser = true;
        dev = false; # disabled
        file-manager = true;
        media = true;
        office = false; # disabled
        pdf = false; # disabled
        wine = true;
      };
      my.home.xwayland-satellite.enable = true;

      # Windows
      my.home.wine-prefix.enable = true;
    };

    # == System modules (NixOS)
    # -- Enable system-level features here:

    # App
    my.system.docker.enable = false; # disabled
    my.system.nautilus.enable = true;
    my.system.steam.enable = true;
    my.system.virt-manager.enable = false; # disabled
    my.system.wine.enable = true;

    #Core
    my.system.boot.enable = true;
    my.system.chattr-nocow.enable = true;
    my.system.kernel = {
      enable = true;
      packages = pkgs.linuxPackages_latest;
      modules = [
        "msr"
        "ntsync"
        "k10temp"
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
    my.system.tmpfiles.enable = true;
    my.system.zsh.enable = true;

    # Desktop
    my.system.codec.enable = true;
    my.system.environment.enable = true;
    my.system.fonts.enable = true;
    my.system.getty.enable = false; # disabled
    my.system.niri.enable = true;
    my.system.stylix.enable = true;
    my.system.uwsm.enable = false; # disabled

    # Hardware
    my.system.bluetooth = {
      enable = true;
      fastConnectable = true;
    };
    my.system.cpu = {
      enable = true;
      vendor = "amd";
    };
    my.system.gpu = {
      enable = true;
      overdrive = true;
    };
    my.system.logind.enable = false; # disabled
    my.system.pipewire = {
      enable = true;
      minQuantum = 256;
      maxQuantum = 2048;
    };
    my.system.pipewire-jack.enable = false; # disabled
    my.system.power.enable = false; # disabled
    my.system.wireplumber-disable-hdmi-dp.enable = false; # disabled

    # Network
    my.system.fail2ban.enable = true;
    my.system.network = {
      enable = true;
      hostName = "nixos";
    };
    my.system.openssh = {
      enable = true;
      port = 62419;
      passwordAuthentication = false;
    };
    my.system.tailscale.enable = false; # disabled
    my.system.zapret.enable = false; # disabled

    # Security
    my.system.hyprlock.enable = true;
    my.system.sops.enable = false; # disabled

    # Service
    my.system.polkit-gnome.enable = true;
    my.system.sunshine.enable = false; # disabled
    my.system.sunshine-stream.enable = false; # disabled
    my.system.tg-ws-proxy.enable = false; # disabled
  };
}
