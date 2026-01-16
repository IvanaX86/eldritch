{ config, ... }:
{
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "3efa5cb78a253dd2"
    ];
  };
}
