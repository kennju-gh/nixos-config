{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.json-yaml;
in
{
  options.my.home.json-yaml = {
    enable = lib.mkEnableOption "json-yaml";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.jq
      pkgs.yq
    ];
  };
}
