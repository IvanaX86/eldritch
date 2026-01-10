{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    gnupg
    kdePackages.ksshaskpass
    mullvad-vpn
    vim
    wget
  ];
}
