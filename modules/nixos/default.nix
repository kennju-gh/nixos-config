{ ... }:
{
  imports = [
    # App
    ./app/carla-yabridge
    ./app/docker
    ./app/nautilus
    ./app/spectral
    ./app/steam
    ./app/virt-manager
    ./app/wine

    # Core
    ./core/boot
    ./core/chattr-nocow
    ./core/kernel
    ./core/locale
    ./core/nix
    ./core/oomd
    ./core/package
    ./core/swap
    ./core/tmpfiles
    ./core/zsh

    # Desktop
    ./desktop/codec
    ./desktop/environment
    ./desktop/fonts
    ./desktop/getty
    ./desktop/niri
    ./desktop/stylix
    ./desktop/uwsm

    # Hardware
    ./hardware/audio
    ./hardware/bluetooth
    ./hardware/cpu
    ./hardware/gpu
    ./hardware/logind
    ./hardware/power

    # Network
    ./network/fail2ban
    ./network/network
    ./network/ssh
    ./network/tailscale
    ./network/zapret

    # Security
    ./security/hyprlock-pam
    ./security/sops

    # Service
    ./service/polkit-agent
    ./service/restic
    ./service/restic-dir
    ./service/sunshine
    ./service/tg-ws-proxy
    ./service/wireplumber-disable-hdmi-dp

    # User
    ./user
  ];
}
