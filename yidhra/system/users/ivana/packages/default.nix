{ config, pkgs, inputs, ... }:
let
  spotify = pkgs.spotify.overrideAttrs (old: {
    version = "1.2.74.477.g3be53afe";
    rev = "89";
    src = pkgs.fetchurl {
      name = "spotify-1.2.74.477.g3be53afe-89.snap";
      url = "https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_89.snap";
      hash = "sha512-mn1w/Ylt9weFgV67tB435CoF2/4V+F6gu1LUXY07J6m5nxi1PCewHNFm8/11qBRO/i7mpMwhcRXaiv0HkFAjYA==";
    };
  });
in
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
        bat
        btop
        chromium
        dig
        dust
        fastfetch
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
        (olympus.override { celesteWrapper = "steam-run"; })
        pavucontrol
        praat
        prismlauncher
        qview
        spotify
        tldr
        tor-browser
        vesktop
        vlc
        wl-clipboard
	      xwayland-satellite
      ];
  };
}
