{ config, lib, pkgs, ... }:
{
  services = {
   printing.enable = true;
    
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
