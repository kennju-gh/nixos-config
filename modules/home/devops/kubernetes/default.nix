{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.kubernetes;
in
{
  options.my.home.kubernetes = {
    enable = lib.mkEnableOption "kubernetes";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubernetes-helm
      pkgs.kubeconform
      pkgs.kustomize
      pkgs.k9s
      pkgs.stern
    ];
  };
}
