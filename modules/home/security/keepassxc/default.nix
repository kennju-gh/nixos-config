{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.keepassxc;
in
{
  options.my.home.keepassxc = {
    enable = lib.mkEnableOption "keepassxc";
  };

  config = lib.mkIf cfg.enable {
    programs.keepassxc = {
      enable = true;
    };
  };
}
