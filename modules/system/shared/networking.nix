{ hostname, ... }:

{
  networking = {
    hostName = hostname;
    # wireless.enable = true;
    networkmanager.enable = true;
    firewall.enable = false;
  };
}
