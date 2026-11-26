{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.lazygit;
in
{
  options.my.home.lazygit = {
    enable = lib.mkEnableOption "lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;

      settings = {
        gui = {
          showBottomLine = false;
        };
      };
    };
  };
}
