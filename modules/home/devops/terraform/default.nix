{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.terraform;
in
{
  options.my.home.terraform = {
    enable = lib.mkEnableOption "terraform";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.terraform
      pkgs.tflint
      pkgs.terraform-docs
      pkgs.terraform-ls
    ];
  };
}
