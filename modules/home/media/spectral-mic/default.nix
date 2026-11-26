{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.spectral-mic;
in
{
  options.my.home.spectral-mic = {
    enable = lib.mkEnableOption "spectral-mic";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.spectral-mic
    ];
  };
}
