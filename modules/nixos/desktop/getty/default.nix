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

    autologin = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Automatically log in user on tty1 without password";
    };

    session = lib.mkOption {
      type = lib.types.str;
      default = "niri.desktop";
      description = "Desktop session file started via uwsm on login";
    };
  };

  config = lib.mkIf cfg.enable {
    services.getty.autologinUser = lib.mkIf cfg.autologin username;

    environment.loginShellInit = ''
      if uwsm check may-start; then
        exec uwsm start ${cfg.session}
      fi
    '';
  };
}
