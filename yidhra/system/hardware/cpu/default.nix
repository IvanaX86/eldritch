{ config, lib, ... }:
{
  hardware.cpu.amd.updateMicrocode = true;
  
  services.upower.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
