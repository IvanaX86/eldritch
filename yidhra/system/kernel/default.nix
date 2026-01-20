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

    kernelModules = [ "kvm-amd" "hid-tmff-new" "hid-tminit-new" "usb-tminit-new" ];
    extraModulePackages = with config.boot.kernelPackages; [
      hid-tmff2
    ];
    blacklistedKernelModules = [ "hid-thrustmaster" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
