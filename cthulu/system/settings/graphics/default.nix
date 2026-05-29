{ config, lib, ... }:
{
  services.xserver.enable = true;
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  environment.variables = {
    NIXOS_OZONE_WL = 1;
    XDG_SESSION_TYPE = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland";
  };
}
