{
  config,
  lib,
  ...
}:
let
  cfg = config.my.home.mangohud;
in
{
  options.my.home.mangohud = {
    enable = lib.mkEnableOption "mangohud";
  };

  config = lib.mkIf cfg.enable {
    programs.mangohud = {
      enable = true;

      settings = {
        font_size = lib.mkForce 24;
        font_size_text = lib.mkForce 24;
        font_scale = lib.mkForce 1.0;

        preset = "0,1";
      };
    };

    xdg.configFile."MangoHud/presets.conf".text = ''
      [preset 0]
      fps
      cpu_temp
      gpu_temp
      ram
      fps_limit=60,120,144,200,0
      fps_limit_method=late
      show_fps_limit
      background_alpha=0.5

      [preset 1]
      fps_limit=60,120,144,200,0
      fps_limit_method=late
      arch
      cpu_mhz
      cpu_power
      cpu_temp
      display_server
      engine_version
      fps_metrics
      gamemode
      gpu_core_clock
      gpu_fan
      gpu_junction_temp
      gpu_mem_clock
      gpu_mem_temp
      gpu_power
      gpu_temp
      gpu_voltage
      ram
      resolution
      show_fps_limit
      vram
      vulkan_driver
      wine
      winesync
      background_alpha=0.5
    '';
  };
}
