{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    
    settings = {
      folders = {
        "Storage" = {
          path = "/home/ivana/.db";
        };
      };
    };
  };
}
