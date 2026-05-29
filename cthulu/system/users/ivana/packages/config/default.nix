{ config, pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      ivana = {
        home = {
          stateVersion = "26.05";
          #activation = {
          #  updateLibreWolf = lib.hm.dag.entryBefore [ "checkLinkTargets" ] "
          #    rm -f /home/ivana/.config/.librewolf/config.ini
          #  ";
          #};
        };

        programs = {
          home-manager.enable = true;
          direnv = {
            enable = true;
            nix-direnv.enable = true;
          };
        };


        imports = [
          ./bun.nix
          ./element-desktop.nix
          ./easyeffects.nix
          ./floorp.nix
	        ./fzf.nix
          ./git.nix
          ./librewolf.nix
	        ./lsd.nix
          ./obsidian.nix
          ./obs-studio.nix
          ./onlyoffice.nix
          ./syncthing.nix
          ./wezterm.nix
          ./xdg.nix
          ./zsh.nix
        ];
      };
    };
  };
}
