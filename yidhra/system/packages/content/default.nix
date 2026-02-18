{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    cage
    corefonts
    element-call
    equibop
    evtest
    fontconfig
    freetype
    gamescope
    gnupg
    inputs.claude-desktop.packages.${system}.claude-desktop
    jami
    kdePackages.ksshaskpass
    krita
    linuxConsoleTools
    linuxKernel.packages.linux_6_18.hid-tmff2
    mission-center
    moonlight-qt
    mullvad-vpn
    oversteer
    pv
    sbclPackages.cl-freetype2
    signal-desktop
    simplex-chat-desktop
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
