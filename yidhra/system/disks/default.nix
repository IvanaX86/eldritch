{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    ( modulesPath + "/installer/scan/not-detected.nix" )
  ];

  boot.initrd.luks.devices = {
    cryptMaster = {
      device = "/dev/disk/by-uuid/e932d698-4cba-4115-80b8-a7108441cf3a";
      preLVM = true;
      allowDiscards = true;
    };
    cryptHome = {
      device = "/dev/disk/by-uuid/a7ee96a8-1b77-4f2c-892e-24289bdbfd18";
      preLVM = true;
      allowDiscards = true;
    };
  };
  
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/48d49462-f47a-44fe-a628-8a24a35a0440";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/C821-B7CC";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/48d49462-f47a-44fe-a628-8a24a35a0440";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/34001dc5-0204-4cad-bf30-db57d3669370";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/home/disk2" = {
      device = "/dev/disk/by-uuid/346de3ed-dcc8-470a-8612-43eecf4ad18e";
      fsType = "ext4";
      options = [ "defaults" "noatime" ];
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/5c0cdd95-ff5d-4108-a9b6-5408ef0796af"; } ];
}
