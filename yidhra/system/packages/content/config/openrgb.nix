{ config, lib, pkgs, ... }:
{
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb;
    motherboard = "amd";
  };
  systemd.user.services.openrgb.serviceConfig.ExecStart = lib.mkForce "${pkgs.openrgb}/bin/openrgb --server --nodetect \"Wooting Two HE (ARM)\"";
}
