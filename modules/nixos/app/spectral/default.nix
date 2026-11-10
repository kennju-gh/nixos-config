{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spectral-mic
  ];
}
