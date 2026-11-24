{ username, ... }:
{
  imports = [
    ./hardware.nix
    ../common/filesystems.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  config = {
    # == System modules (NixOS)
    # -- Enable system-level features here:

    boot.kernelParams = [
      # amdgpu params are kept commented for debugging reference.
      # "amdgpu.dcdebugmask=0x410"
      # "amdgpu.no_vpe_idle_pg=1"
      # "amdgpu.runpm=0"
      "amdgpu.gpu_recovery=1" # reset GPU after a hang instead of requiring reboot.
    ];

    boot.initrd.kernelModules = [
      "amdgpu"
    ];

    boot.kernelModules = [
      "coretemp"
    ];

    my.system.tailscale = {
      enable = true;
    };

    my.system.sunshine = {
      enable = true;
    };

    my.system.audio = {
      enable = true;
      quantum = 512;
      minQuantum = 64;
      maxQuantum = 1024;
    };

    # == User modules (Home Manager)
    # -- Enable user-level features here:

    home-manager.users.${username} = {

      # CLI

      # Media
      my.home.coppwr = {
        enable = true;
      };

    };
  };
}
