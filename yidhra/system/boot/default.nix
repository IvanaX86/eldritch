{ config, lib, ... }:
{
  boot.loader = {
    limine = {
      enable = true;
      efiSupport = true;
    };

    efi.canTouchEfiVariables = true;
  };
}
