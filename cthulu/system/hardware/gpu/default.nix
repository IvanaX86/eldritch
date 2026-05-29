{ config, lib, pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
	intel-media-driver
      ];
      
    };
  };
  environment = {
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
}
