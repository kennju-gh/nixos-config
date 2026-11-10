{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [
    "msr"
    "ntsync"
  ];
}
