{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    # Core system & Base utilities
    pkgs.coreutils
    pkgs.man-pages
    pkgs.procps
    pkgs.killall
    pkgs.file
    pkgs.pv

    # Archives & File systems
    pkgs.trash-cli
    pkgs.gnutar
    pkgs.gzip
    pkgs.unzip

    # Networking
    pkgs.wireguard-tools
    pkgs.dnsutils
    pkgs.openssh
    pkgs.socat
    pkgs.wget
    pkgs.curl

    # CLI
    pkgs.ripgrep
    pkgs.dust
    pkgs.bat
    pkgs.eza
    pkgs.fd

    # Audio & Media managment
    pkgs.playerctl
    pkgs.wiremix
    pkgs.pipewire.jack

    # Hadrware, Diagnostics & Monitoring
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
    pkgs.nvtopPackages.amd

    # Grafics & Notifications
    pkgs.libnotify

    # Thumbnails
    pkgs.ffmpegthumbnailer
    pkgs.ffmpeg-headless

    # Cryptography, Secrets & Recovery
    pkgs.gnupg
  ];
}
