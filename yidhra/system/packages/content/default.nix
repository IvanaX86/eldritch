{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    gamescope
    gnupg
    kdePackages.ksshaskpass
    mullvad-vpn
    vim
    wget
  ];
}
