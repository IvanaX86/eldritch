{ config, lib, pkgs, ... }:
{
  services = {
   printing.enable = true;
    
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      drivers = [ pkgs.brlaser ];
    };
  };
}
