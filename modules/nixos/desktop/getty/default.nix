{
  username,
  config,
  lib,
  ...
}:
let
  cfg = config.my.system.getty;
in
{
  options.my.system.getty = {
    enable = lib.mkEnableOption "getty";

    session = lib.mkOption {
      type = lib.types.str;
      default = "niri.desktop";
      description = "Desktop session file started via uwsm on login";
    };
  };

  config = lib.mkIf cfg.enable {
    services.getty.autologinUser = username;

    environment.loginShellInit = ''
      if uwsm check may-start; then
        exec uwsm start ${cfg.session}
      fi
    '';
  };
}
