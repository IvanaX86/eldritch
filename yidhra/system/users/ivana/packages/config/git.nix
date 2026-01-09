{ config, pkgs, inputs, ... }:
{
  home-manager.users.ivana.programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Ivana Walencja Zrobczynska";
        email = "github@ivanax86.dev";
      };
      commit = {
        gpgSign = true;
      };
      init.defaultBranch = "main";
    };
  };
}
