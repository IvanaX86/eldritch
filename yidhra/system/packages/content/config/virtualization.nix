{ config, pkgs, ...}:
{
  programs = {
    virt-manager = {
      enable = true;
    };
  };

  environment.systemPackages = [ pkgs.qemu ];

  virtualisation = {
    libvirtd = {
      enable = true;
      
      qemu = {
        runAsRoot = false;
        
        swtpm = {
          enable = true;
        };
        vhostUserPackages = [
          pkgs.virtiofsd
        ];
      };
    };
  };
}
