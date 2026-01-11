{ inputs, ... }:
let
  inherit (inputs) self;
  inherit (self) lib;
in
{
  yidhra = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit lib inputs self;
    };

    modules = [
      ./boot
      ./disks
      ./hardware
      ./kernel
      ./network
      ./packages
      ./settings
      ./users
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-gaming.nixosModules.pipewireLowLatency
    ];
  };
}
