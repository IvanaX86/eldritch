{config, pkgs, ... }:
{
  home-manager.users.ivana.programs = {
    onlyoffice = {
      enable = true;
      settings = {
        UITheme = "theme-contrast-dark";
      };
    };
  };
}
