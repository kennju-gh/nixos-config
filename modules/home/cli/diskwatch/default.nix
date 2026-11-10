{ pkgs, ... }:
{
  home.packages = with pkgs; [
    diskwatch
  ];
}
