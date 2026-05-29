{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    
    settings = {
      folders = {
        "Storage" = {
          path = "/home/ivana/.db";
        };
      };
    };
  };
}
