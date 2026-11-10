{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core system & Base utilities
    coreutils
    man-pages
    procps
    killall
    file
    pv

    # Archives & File systems
    trash-cli
    gnutar
    gzip
    unzip

    # Networking
    wireguard-tools
    dnsutils
    openssh
    socat
    wget
    curl

    # CLI
    ripgrep
    dust
    bat
    eza
    fd

    # Audio & Media managment
    playerctl
    wiremix
    pipewire.jack

    # Hadrware, Diagnostics & Monitoring
    smartmontools
    dmidecode
    lm_sensors
    powertop
    pciutils
    usbutils
    nvme-cli
    ddcutil
    nftables
    e2fsprogs
    tldr
    ncdu
    lsof
    strace
    nvtopPackages.amd

    # Grafics & Notifications
    libnotify

    # Thumbnails
    ffmpegthumbnailer
    ffmpeg-headless

    # Cryptography, Secrets & Recovery
    gnupg
  ];
}
