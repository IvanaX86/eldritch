{ pkgs, lib, ... }:
{
  services = {
    xserver = {
      exportConfiguration = lib.mkForce true;
      xkb = {
        extraLayouts = {
          "gb_de" = {
            description = "GB layout with German umlauts on right alt";
            languages = [ "eng" "deu" ];
            symbolsFile = ./gb-de;
          };
        };
      };
    };
  };
}
