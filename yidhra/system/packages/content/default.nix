{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    binutils
    bison
    cage
    corefonts
    dino
    element-call
    equibop
    evtest
    fontconfig
    freetype
    gamescope
    gcc
    gnumake
    gnupg
    inputs.claude-desktop.packages.${system}.claude-desktop
    jami
    jmtpfs
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.ksshaskpass
    kdePackages.kwallet
    krita
    libmtp
    libressl
    linuxConsoleTools
    linuxKernel.packages.linux_6_18.hid-tmff2
    m4
    mission-center
    moonlight-qt
    mullvad-vpn
    oversteer
    pv
    python3
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
  ];
  services.udev.packages = with pkgs; [
    oversteer
    wooting-udev-rules
  ];
}
