{ config, pkgs, ... }:
{
  home-manager = {
    users = {
      ivana = { 
        programs = {
          obsidian = {
            enable = true;
          };
        };
      };
    };
  };
}
