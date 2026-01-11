{ config, lib, pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;

    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };
}
