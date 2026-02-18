{ config, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
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
          ./bun.nix
          ./element-desktop.nix
          ./floorp.nix
          ./git.nix
          ./obsidian.nix
          ./onlyoffice.nix
          ./xdg.nix
          ./zsh.nix
        ];
      };
    };
  };
}
