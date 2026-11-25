{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.terraform
    pkgs.tflint
    pkgs.terraform-docs
    pkgs.terraform-ls
  ];
}
