{ config, lib, ... }:
{
  boot.initrd.systemd.dbus.enable = true;

  services = {
    displayManager.ly.enable = true;
  };
}
