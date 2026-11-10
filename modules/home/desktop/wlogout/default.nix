{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wlogout
  ];

  xdg.configFile."wlogout/layout".source = ./configs/layout;
  xdg.configFile."wlogout/style.css".source = ./configs/style.css;
  xdg.configFile."wlogout/assets/shutdown.png".source = ./configs/assets/shutdown.png;
  xdg.configFile."wlogout/assets/decor_left.png".source = ./configs/assets/decor_left.png;
  xdg.configFile."wlogout/assets/reboot.png".source = ./configs/assets/reboot.png;
  xdg.configFile."wlogout/assets/lock.png".source = ./configs/assets/lock.png;
  xdg.configFile."wlogout/assets/suspend.png".source = ./configs/assets/suspend.png;
  xdg.configFile."wlogout/assets/decor_right.png".source = ./configs/assets/decor_right.png;
}
