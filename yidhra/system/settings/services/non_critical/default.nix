{ config, lib, ... }:
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
  };
}
