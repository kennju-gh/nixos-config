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
    my.system.logind.enable = false;
    my.system.pipewire = {
      enable = true;
      minQuantum = 256;
      maxQuantum = 2048;
    };
    my.system.pipewire-jack.enable = false;
    my.system.wireplumber-disable-hdmi-dp.enable = false;
  };
}
