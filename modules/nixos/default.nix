{ ... }:
{
  imports = [
    # App
    ./app/docker
    ./app/nautilus
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
    ./hardware/bluetooth
    ./hardware/cpu
    ./hardware/gpu
    ./hardware/logind
    ./hardware/pipewire
    ./hardware/pipewire-jack
    ./hardware/power
    ./hardware/wireplumber-disable-hdmi-dp

    # Network
    ./network/fail2ban
    ./network/network
    ./network/openssh
    ./network/tailscale
    ./network/zapret

    # Security
    ./security/hyprlock
    ./security/sops

    # Service
    ./service/polkit-gnome
    ./service/restic
    ./service/restic-dir
    ./service/sunshine
    ./service/sunshine-stream
    ./service/tg-ws-proxy

    # User
    ./user
  ];
}
