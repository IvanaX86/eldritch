{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    gnupg
    kdePackages.ksshaskpass
    vim
    wget
  ];
}
