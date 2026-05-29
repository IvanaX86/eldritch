{ config, lib, pkgs, inputs, ... }:
  let

  proton-ge-9 = pkgs.proton-ge-bin.overrideAttrs (oldAttrs: rec {
    version = "GE-Proton9-2";

    src = pkgs.fetchzip {
      url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}.tar.gz";
      hash = "sha256-NqBzKonCYH+hNpVZzDhrVf+r2i6EwLG/IFBXjE2mC7s=";
    };

    preFixup = ''
      substituteInPlace "$steamcompattool/compatibilitytool.vdf" \
        --replace-fail "${version}" "${version}"
    '';
  });

in {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;

    extraCompatPackages = [
      pkgs.proton-ge-bin
      proton-ge-9
    ];
  };
}
