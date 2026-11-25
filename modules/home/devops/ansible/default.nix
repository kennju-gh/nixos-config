{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.ansible
    pkgs.ansible-lint
  ];
}
