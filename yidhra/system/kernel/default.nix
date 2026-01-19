{ config, lib, pkgs, ... }:
{
  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    initrd.kernelModules = [ "dm-snapshot" ];

    kernelModules = [ "kvm-amd" "hid-tmff2" ];
    extraModulePackages = [ ];
    blacklistedKernelModules = [ "hid-thrustmaster" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
