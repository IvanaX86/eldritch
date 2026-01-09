{ config, ... }:
{
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      80   #HTTP
      443  #HTTPS
      8080 #HTTP (alternate)
    ];
    allowedUDPPorts = [
      80   #HTTP
      443  #HTTPS
      8080 #HTTP (alternate)
    ];
  };
}
