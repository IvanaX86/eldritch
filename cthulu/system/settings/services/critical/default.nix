{ config, lib, ... }:
{
  boot.initrd.systemd.dbus.enable = true;
  
  security.pam.services.login.enableGnomeKeyring = false;
  

  services = {
    displayManager.ly.enable = true;
    gnome.gnome-keyring.enable = false;
  };
}
