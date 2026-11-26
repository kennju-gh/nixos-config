{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.direnv;
in
{
  options.my.home.direnv = {
    enable = lib.mkEnableOption "direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      silent = true;
    };
  };
}
