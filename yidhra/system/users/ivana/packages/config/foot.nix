{config, pkgs, ... }:
{
  programs = {
    foot = {
      enable = true;

      settings = {
        main = {
          dpi-aware = "yes";
          font = "Hurmit Nerd Font Mono:size=10";
          gamma-correct-blending = "1";
        };
        
        bell = {
          system = "no";
        };
        
        scrollback = {
          lines= "10000";
        };

        cursor = {
          style = "block";
        };

        colors-dark = {
          foreground = "fc2171";
          background = "000000";
        };
      };
    };
  };
}
