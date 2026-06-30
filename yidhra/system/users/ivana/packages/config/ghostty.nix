{ config, pkgs, ... }:
{
  programs = {
    ghostty = {
      enable = true;
      #enableZshIntegration = true;
      installBatSyntax = true;
      
      systemd = {
        enable = true;
      };

      settings = {
        quit-after-last-window-closed = false;

        font-size = 10;

        theme = "Glacier";
        background = "000000";
        foreground = "FF337E";
      };
    };
  };
}
