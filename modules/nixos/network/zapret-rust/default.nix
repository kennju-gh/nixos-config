{ ... }:
{
  services.zapret-rust = {
    enable = false;
    interface = "enp6s0";
    strategy = "general.bat";
    backend = "nftables";
  };
}
