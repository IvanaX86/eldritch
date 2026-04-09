{ config, pkgs, ... }:
{
  services.sunshine = {
   enable = true;
   autoStart = false;
   capSysAdmin = true; # required for Wayland capture
   openFirewall = true;
};
}
