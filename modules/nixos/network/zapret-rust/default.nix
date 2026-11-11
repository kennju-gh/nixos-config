{ ... }:
{
  services.zapret-rust = {
    enable = true;
    interface = "enp6s0";
    strategy = "general.bat";
    backend = "nftables";
  };
}
