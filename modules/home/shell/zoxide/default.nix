{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.zoxide;
in
{
  options.my.home.zoxide = {
    enable = lib.mkEnableOption "zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
