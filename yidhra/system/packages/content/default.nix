{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    gamescope
    gnupg
    kdePackages.ksshaskpass
    linuxKernel.packages.linux_6_18.hid-tmff2
    mullvad-vpn
    oversteer
    teams-for-linux
    vim
    wget
    wootility
    qbittorrent
  ];
  services.udev.packages = with pkgs; [
    oversteer
  ];
}
