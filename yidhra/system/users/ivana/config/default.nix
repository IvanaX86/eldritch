{ config, lib, pkgs, ... }:
{
  users.users = {
    ivana = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };
  };
}
