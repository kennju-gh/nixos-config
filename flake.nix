{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    # nixos-hardware = {
    #   url = "github:NixOS/nixos-hardware/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-rust = {
      url = "github:Sergeydigl3/zapret-discord-youtube-rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkHost = import ./lib/mkHost.nix { inherit inputs; };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop" "kennsa" { main = "/dev/nvme1n1"; }; # (lsblk) "kennju"
        laptop = mkHost "laptop" "kennsa" { main = "/dev/nvme1n1"; }; # (lsblk)
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
