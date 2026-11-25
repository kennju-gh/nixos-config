{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.yamllint
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.hadolint
    pkgs.actionlint
    pkgs.nix-output-monitor
    pkgs.nixfmt
    pkgs.nixd
    pkgs.statix
    pkgs.deadnix
  ];
}
