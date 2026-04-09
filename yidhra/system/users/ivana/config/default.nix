{ config, lib, pkgs, ... }:
{
  users.users = {
    ivana = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" ];
      packages = with pkgs; [
        tree
      ];
      shell = pkgs.zsh;
    };
  };
}
