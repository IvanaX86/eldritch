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
      ./hardware
      ./kernel
      ./network
      ./packages
      ./settings
      ./storage
      ./users
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}
