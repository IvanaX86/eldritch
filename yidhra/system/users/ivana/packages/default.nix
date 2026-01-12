{ config, pkgs, inputs, ... }:
{
  imports = [
    ./config
  ];

  home-manager.users.ivana.home = {
      #programs.home-manager.enable = true;
      stateVersion = config.system.stateVersion;
      username = "ivana";
      homeDirectory = "/home/ivana";

      packages = with pkgs; [
        dig
        firefox
        floorp-bin
        fuzzel
        git
      	htop
        kdePackages.dolphin
        kdePackages.kleopatra
        keepassxc
        kitty
        krita
        neovim
        pavucontrol
        qview
        tor-browser
        vesktop
        vlc
        wl-clipboard
	      xwayland-satellite
      ];
  };
}
