{ config, pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      nerd-fonts.hurmit
    ];
  };
}
