{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubernetes-helm
    pkgs.kubeconform
    pkgs.kustomize
    pkgs.k9s
    pkgs.stern
  ];
}
