{ config, ... }:
{
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      80    # HTTP
      443   # HTTPS
      8080  # HTTP (alternate)
      9993  # Zerotier
    ];
    allowedUDPPorts = [
      80    # HTTP
      443   # HTTPS
      1400  # Mullvad
      8080  # HTTP (alternate)
      51820 # Wireguard/Mullvad
    ];
    allowedUDPPortRanges = [ ];
    # Wireguard
    interfaces.wg0 = {
      allowedUDPPorts = [ 51820 ];
      allowedTCPPorts = [ ];
    };
  };
}
