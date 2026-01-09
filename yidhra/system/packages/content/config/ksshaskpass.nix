{ config, pkgs, ... }:
{
  programs.ssh.askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  environment.sessionVariables = {
    SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";
  };
  nixpkgs.config.packageOverrides = pkgs: {
    x11_ssh_askpass = pkgs.kdePackages.ksshaskpass;
  };
} 
