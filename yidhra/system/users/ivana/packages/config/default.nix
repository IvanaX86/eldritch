{ config, pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      ivana = {
        home.stateVersion = "25.11";
        programs = {
          home-manager.enable = true;
          direnv = {
            enable = true;
            nix-direnv.enable = true;
          };
        };

        imports = [
          ./bat.nix
          ./bun.nix
          ./element-desktop.nix
          ./easyeffects.nix
          #./floorp.nix
          ./foot.nix
	        ./fzf.nix
          #./ghostty.nix
          ./git.nix
          ./librewolf.nix
	        ./lsd.nix
          ./obsidian.nix
          ./obs-studio.nix
          ./onlyoffice.nix
          ./syncthing.nix
          ./xdg.nix
          ./zellij.nix
          ./zsh.nix
        ];
      };
    };
  };
}
