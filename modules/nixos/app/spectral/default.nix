{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.spectral-mic
  ];
}
