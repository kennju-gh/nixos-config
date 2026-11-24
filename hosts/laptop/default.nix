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

    my.system.audio = {
      enable = true;
      quantum = 512;
      minQuantum = 128;
      maxQuantum = 2048;
    };

    my.system.logind = {
      enable = true;
    };

    # == User modules (Home Manager)
    # -- Enable user-level features here:

    home-manager.users.${username} = {

      # CLI
      my.home.gsettings = {
        enable = true;
      };

      # Media
      my.home.coppwr = {
        enable = true;
      };

      my.home.foliate = {
        enable = true;
      };

    };
  };
}
