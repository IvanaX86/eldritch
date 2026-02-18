{ config, pkgs, ... }:
{
  programs = { 
    floorp = {
      #enable = true;
      #package = pkgs.floorp-bin;

      profiles.default = {
        settings = {
          "browser.tabs.insertAfterCurrent" = true;
        };
      };
    };
  };
}
