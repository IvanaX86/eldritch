{ config, pkgs, ... }:
{
  services.sunshine = {
   enable = true;
   autoStart = true;
   capSysAdmin = true; # required for Wayland capture
   openFirewall = true;
};
}
