{ ... }: # username
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

    # home-manager.users.${username} = {
    #   my.home.reaper = {
    #     enable = true;
    #   };
    #   my.home.obs = {
    #     enable = true;
    #   };
    # };
  };
}
