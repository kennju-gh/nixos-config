{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.go;
in
{
  options.my.home.go = {
    enable = lib.mkEnableOption "go";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.go
      pkgs.gopls
      pkgs.gotools
      pkgs.golangci-lint
      pkgs.delve
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/go/bin"
    ];
  };
}
