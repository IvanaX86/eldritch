{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ websurfx ];
  systemd.services.websurfx = {
    enable = true;
    description = "Websurfx metasearch engine";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.websurfx}/bin/websurfx";
      DynamicUser = true;          
      Restart = "on-failure";
      RestartSec = 5;
      ProtectSystem = "strict";
      ProtectHome = true;
      PrivateTmp = true;
      NoNewPrivileges = true;
    };
  };
}
