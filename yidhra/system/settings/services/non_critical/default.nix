{ config, lib, pkgs, ... }:
{
  services = {
    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      server = {
        port = 6742;
      };
    };
    printing.enable = true;
    
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
