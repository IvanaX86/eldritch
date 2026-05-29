{ config, lib, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;
  
  services.upower.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
