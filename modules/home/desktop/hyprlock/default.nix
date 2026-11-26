{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.hyprlock;
  colors = config.lib.stylix.colors;
  wallpaper = ./assets/wallpaper.png;
  avatar = ./assets/avatar.png;
in
{
  options.my.home.hyprlock = {
    enable = lib.mkEnableOption "hyprlock";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          hide_cursor = true;
        };

        background = [
          {
            monitor = "";
            path = "${wallpaper}";
            blur_passes = 1;
            blur_size = 1;
            contrast = 0.8916;
            brightness = 0.9500;
            vibrancy = 0.1696;
          }
        ];

        image = [
          {
            monitor = "";
            path = "${avatar}";
            size = 170;
            rounding = -1;
            border_size = 2;
            border_color = "rgb(${colors.base03})";
            position = "0, 80";
            halign = "center";
            valign = "center";
          }
        ];

        input-field = [
          {
            size = "250, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(${colors.base05})";
            inner_color = "rgb(${colors.base01})";
            outer_color = "rgb(${colors.base03})";
            check_color = "rgb(${colors.base03})";
            fail_color = "rgb(${colors.base03})";
            outline_thickness = 2;
            placeholder_text = "Enter password...";
            shadow_passes = 2;
          }
        ];
      };
    };

    stylix.targets.hyprlock.enable = false;
  };
}
