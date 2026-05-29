{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    ( modulesPath + "/installer/scan/not-detected.nix" )
  ];

  boot.initrd.luks.devices = {
    cryptRoot = {
      device = "/dev/disk/by-uuid/8c017b24-60da-4615-af4e-ac1bd54ee3df";
      preLVM = true;
      allowDiscards = true;
    };
  };
  
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/251A-3A89";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };
    "/snapshots" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" "compress=zstd" "noatime" ];
    };
    "/var/lib" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@varLib" "compress=no" "noatime" ];
    };
    "/var/log" = {
      device = "/dev/disk/by-uuid/7c5778b8-63c1-4d6e-b9e0-adee585cc77a";
      fsType = "btrfs";
      options = [ "subvol=@varLog" "compress=zstd" "noatime" ];
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/ef4e370a-bd89-4354-9208-ad80074d15f8"; } ];
}
