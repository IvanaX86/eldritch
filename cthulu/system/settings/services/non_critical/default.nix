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
    omnisearch = {
      enable = true;
    };
    gvfs = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };
  };
  system.nssModules = with pkgs; [ nssmdns ];
  services.udev.packages = [ pkgs.libmtp.out ];
  hardware.bluetooth.enable = true;
}
