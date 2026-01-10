{ config, ... }:
{
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      80    # HTTP
      443   # HTTPS
      1401  # Mullvad
      6050  # TOR
      8080  # HTTP (alternate)
    ];
    allowedUDPPorts = [
      53    # Mullvad
      80    # HTTP
      443   # HTTPS
      1400  # Mullvad
      8080  # HTTP (alternate)
      51820 # Wireguard/Mullvad
    ];
    allowedUDPPortRanges = [
      { # Mullvad
        from = 1194;
        to   = 1197;
      }
      { # Mullvad
        from = 1300;
        to   = 1303;
      }
    ];
    # Wireguard
    interfaces.wg0 = {
      allowedUDPPorts = [ 51820 ];
      allowedTCPPorts = [ ];
    };
  };
}
