{
  username,
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.system.nix;

in
{
  options.my.system.nix = {
    enable = lib.mkEnableOption "nix";

    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "26.05";
      description = "NixOS state version set at initial installation";
    };
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings = {
        allowed-users = [
          username
          "root"
        ];
        trusted-users = [
          username
          "root"
        ];
        max-jobs = "auto";
        cores = 0;

        auto-optimise-store = true;

        sandbox = true;
        builders-use-substitutes = true;
        fsync-metadata = false;

        allowed-uris = [
          "github:"
          "gitlab:"
          "git+https:"
          "git+ssh:"
          "https:"
        ];

        connect-timeout = 100;

        substituters = [
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
          "https://niri.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        ];

        log-lines = 25;
        show-trace = true;

        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      gc = {
        automatic = !config.programs.nh.clean.enable;
        dates = "Sun 03:00";
        options = "--delete-older-than 14d";
      };

      optimise = {
        automatic = true;
        dates = [ "03:00" ];
      };
    };

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3";
      };
      flake = toString inputs.self;
    };

    programs.nix-ld.enable = true;

    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    environment.systemPackages = [
      pkgs.nix-tree
    ];

    documentation.man.cache.enable = false;
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = cfg.stateVersion;
  };
}
