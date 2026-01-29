{ config, pkgs, ... }:
{
  home-manager = {
    users = { 
      ivana = { 
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
      };
    };   
  };
}
