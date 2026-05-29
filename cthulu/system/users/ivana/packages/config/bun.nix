{ config, pkgs, ... }:
{
  programs = {
    bun = {
      enable = true;

      settings = {
        smol = true;
        loglevel = "debug";
        telemetry = false;

        test = {
          coverage = true;
          coverageThreshold = 0.9;
        };
        install.lockfile = {
          print = "yarn";
        };
      };
    };
  };
}
