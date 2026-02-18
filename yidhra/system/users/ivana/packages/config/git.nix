{ config, pkgs, inputs, ... }:
{
  programs = {
    git = {
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
      extraConfig = {
        core.askPass = "ksshaskpass";
      };
    };
  };
}
