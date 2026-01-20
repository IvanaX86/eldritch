{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    corefonts
    fontconfig
    freetype
    gamescope
    gnupg
    kdePackages.ksshaskpass
    linuxKernel.packages.linux_6_18.hid-tmff2
    mullvad-vpn
    oversteer
    sbclPackages.cl-freetype2
    teams-for-linux
    vim
    wget
    wootility
    qbittorrent
    unzip
    usbutils
    winetricks
    wineWowPackages.staging
  ];
  services.udev.packages = with pkgs; [
    oversteer
  ];
}
