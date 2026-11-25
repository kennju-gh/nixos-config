{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.imv
  ];

  xdg.configFile."imv/config".text = ''
    [binds]
    <Delete> = exec trash "$imv_current_file"; next
  '';
}
