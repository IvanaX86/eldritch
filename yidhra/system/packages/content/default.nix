{ config, lib, pkgs, ... }:
{
  imports = [
    ./config
  ];

  environment.systemPackages = with pkgs; [
    gnupg
    vim
    wget
  ];
}
