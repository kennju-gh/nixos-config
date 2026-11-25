{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.obsidian;
in
{
  options.my.home.obsidian = {
    enable = lib.mkEnableOption "obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
