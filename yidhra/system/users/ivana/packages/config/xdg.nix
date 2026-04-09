{ config, libs, pkgs, inputs, ... }:
{
  xdg = {
    enable = true;
    mime.enable = true;
    
    mimeApps = {
      enable = true;

      defaultApplications = {
        "text/html" = "floorp.desktop";
        "text/plain" = "floorp.desktop";
        "application/xhtml+xml" = "floorp.desktop";
        "x-scheme-handler/http" = "floorp.desktop";
        "x-scheme-handler/https" = "floorp.desktop";
        "x-scheme-handler/roblox-player" = "org.vinegarhq.Sober.desktop";
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      download  = "/home/ivana/Downloads";
      desktop   = "/home/ivana/Desktop";
      documents = "/home/ivana/Documents";
      music     = "/home/ivana/Music";
      pictures  = "/home/ivana/Pictures";
      videos    = "/home/ivana/Videos";
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
        "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
        "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        };
      };
    };
  }; 
}
