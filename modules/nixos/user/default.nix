{
  inputs,
  username,
  hostName,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.user;
in
{
  options.my.system.user = {
    enable = lib.mkEnableOption "user";

    extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "wheel"
        "networkmanager"
        "docker"
        "libvirtd"
        "kvm"
        "i2c"
        "audio"
        "realtime"
        "video"
      ];
      description = "Supplementary groups for the main user";
    };

    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "26.05";
      description = "Home Manager state version set at initial installation";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${username} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = cfg.extraGroups;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit
          inputs
          username
          hostName
          ;
      };

      users.${username} = {
        imports = [ ../../home ];

        home = {
          username = username;
          homeDirectory = "/home/${username}";
          stateVersion = cfg.stateVersion;
        };

        programs.home-manager.enable = true;
      };
    };
  };
}
