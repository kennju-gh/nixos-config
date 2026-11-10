{ inputs }:
hostName: username: disks:
let
  system = "x86_64-linux";
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      username
      disks
      hostName
      ;
  };
  modules = [
    {
      nixpkgs.overlays = [
        (import ../overlays/stable.nix { inherit inputs; })
      ];
    }
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    ../modules/nixos
    ../hosts/${hostName}/default.nix
  ];
}
