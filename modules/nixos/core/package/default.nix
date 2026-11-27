{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.package;
in
{
  options.my.system.package = {
    enable = lib.mkEnableOption "package";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      # Archives & File systems
      pkgs.trash-cli
      pkgs.gnutar
      pkgs.gzip
      pkgs.unzip

      # Audio & Media management
      pkgs.playerctl
      pkgs.wiremix

      # Core system & Base utilities
      pkgs.coreutils
      pkgs.man-pages
      pkgs.procps
      pkgs.killall
      pkgs.file
      pkgs.pv

      # CLI
      pkgs.ripgrep
      pkgs.dust
      pkgs.bat
      pkgs.eza
      pkgs.fd

      # Cryptography, Secrets
      pkgs.gnupg

      # Graphics & Notifications
      pkgs.libnotify

      # Hardware, Diagnostics & Monitoring
      pkgs.smartmontools
      pkgs.dmidecode
      pkgs.lm_sensors
      pkgs.powertop
      pkgs.pciutils
      pkgs.usbutils
      pkgs.nvme-cli
      pkgs.ddcutil
      pkgs.nftables
      pkgs.e2fsprogs
      pkgs.tldr
      pkgs.ncdu
      pkgs.lsof
      pkgs.strace

      # Networking
      pkgs.dnsutils
      pkgs.openssh
      pkgs.socat
      pkgs.wget
      pkgs.curl

      # Thumbnails
      pkgs.ffmpegthumbnailer
      pkgs.ffmpeg-headless
    ];
  };
}
