{ config, lib, pkgs, ... }:
{
  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
      config = {allowUnfree = true;
      permittedInsecurePackages = [
        "pnpm-10.29.2"
      ];
    };
  };
  nix.settings = {
    extra-substituters = [ 
      "https://ghostty.cachix.org" 
      "https://wezterm.cachix.org"
    ];
    extra-trusted-public-keys = [ 
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
    ];
  };
}

