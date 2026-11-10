{ inputs }:
final: prev: {
  stable = import inputs.nixpkgs-stable {
    system = final.stdenv.hostPlatform.system;
    config = final.config;
  };
}
