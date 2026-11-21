{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pince
  ];
}
