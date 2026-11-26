{
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.swap;
in
{
  options.my.system.swap = {
    enable = lib.mkEnableOption "swap";
  };

  config = lib.mkIf cfg.enable {
    boot.zswap = {
      enable = true;
      compressor = "zstd";
      maxPoolPercent = 25;
      shrinkerEnabled = true;
    };

    boot.kernel.sysctl."vm.swappiness" = 100;
  };
}
