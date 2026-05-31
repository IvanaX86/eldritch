{ config, libs, pkgs, inputs, ... }:
{
  xdg = {
    enable = true;
    mime.enable = true;
    
    mimeApps = {
      enable = true;

      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "text/plain" = "librewolf.desktop";
        "application/xhtml+xml" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
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
