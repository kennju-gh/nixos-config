{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.lint;
in
{
  options.my.home.lint = {
    enable = lib.mkEnableOption "lint";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.yamllint
      pkgs.shellcheck
      pkgs.shfmt
      pkgs.hadolint
      pkgs.actionlint
      pkgs.nix-output-monitor
      pkgs.nixfmt
      pkgs.nixd
      pkgs.statix
      pkgs.deadnix
    ];
  };
}
