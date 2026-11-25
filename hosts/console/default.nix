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

    };

    # == System modules (NixOS)
    # -- Enable system-level features here:

    # Hardware
    my.system.audio = {
      enable = true;
      minQuantum = 256;
      maxQuantum = 2048;
    };
  };
}
