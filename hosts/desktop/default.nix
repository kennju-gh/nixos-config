{ ... }:
{
  imports = [
    ./hardware.nix
    ../common/filesystems.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  # == System modules (NixOS)
  # -- Enable system-level features here:

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

  my.system.wine = {
    enable = true;
  };

  my.system.carla-yabridge = {
    enable = true;
  };

  my.system.tailscale = {
    enable = true;
  };

  my.system.sunshine = {
    enable = true;
  };

  my.system.audio = {
    enable = true;
    quantum = 256;
    minQuantum = 64;
    maxQuantum = 1024;
  };

  my.system.wireplumber.disableHdmiDp = {
    enable = true;
    devices = [ "alsa_card.pci-0000_03_00.1" ]; # (wpctl status)
  };

  my.system.wireplumber.gameAudio = {
    enable = true;
  };

  my.system.sunshineStream = {
    enable = true;
  };

  # == User modules (Home Manager)
  # -- Enable user-level features here:

  my.home.reaper = {
    enable = true;
  };

  my.home.obs = {
    enable = true;
  };
}
