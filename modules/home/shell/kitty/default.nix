{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.kitty;
in
{
  options.my.home.kitty = {
    enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        window_padding_width = 10;
      };
    };
  };
}
