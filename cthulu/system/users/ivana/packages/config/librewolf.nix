{ config, pkgs, ... }:
let
LibreWolfCfg = pkgs.writeText "mozilla.cfg" ''
    // comment
    try {
      const { AboutNewTab } = ChromeUtils.importESModule("resource:///modules/AboutNewTab.sys.mjs");
      AboutNewTab.newTabURL = "http://localhost:8087";
// test
      const Services = globalThis.Services || ChromeUtils.importESModule("resource://gre/modules/Services.sys.mjs").Services;
      const { BrowserWindowTracker } = ChromeUtils.importESModule("resource:///modules/BrowserWindowTracker.sys.mjs");

      Services.obs.addObserver(() => {
        const win = BrowserWindowTracker.getTopWindow();
        if (win) win.gBrowser.selectedBrowser.focus();
      }, "browser-open-newtab-start");
    } catch(e) {
      Components.utils.reportError(e);
    }
  '';

  autoconfigJs = pkgs.writeText "autoconfig.js" ''
    pref("general.config.filename", "mozilla.cfg");
    pref("general.config.obscure_value", 0);
  '';

  LibreWolfWithAutoconfig = pkgs.librewolf.overrideAttrs (old: {
    buildCommand =
      (old.buildCommand or "")
      + ''
        install -Dm644 ${LibreWolfCfg} $out/lib/librewolf/mozilla.cfg
        install -Dm644 ${autoconfigJs} $out/lib/librewolf/defaults/pref/autoconfig.js
      '';
  });
in
{
  programs = {
    librewolf = {
      enable = true;
      package = LibreWolfWithAutoconfig;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;
      };

      profiles = {
        default = {
          userChrome = "
            #TabsToolbar { display: none !important; }
            #sidebar-box #sidebar-header { display: none !important; }

            * { border-radius: 1px !important; }
          ";
        };
      };

      policies = {
        DisableAppUpdate = true;
        
        Homepage = {
          URL = "http://localhost:8087";
          StartPage = "homepage";
        };

        SearchEngines = {
          default = "omnisearch";
          Remove = [
            "MetaGer"
            "Searx Belgium"
          ];
          Add = [
            { 
              Name = "omnisearch";
              URLTemplate = "http://localhost:8087/search?q={searchTerms}";
              Method = "GET";
              IconURL = "http://localhost:8087/static/favicon.ico";
          }];
        };
        NewTabPage = false;
        ExtensionSettings = {
          "*" = {
            install_sources = [
              "https://addons.mozilla.org/*"
              "https://tridactyl.cmcaine.co.uk/*"
            ];
          };

          # Sideberry
          "{3c078156-979c-498b-8990-85f7987dd929}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
            installation_mode = "force_installed";
          };
          # Dark Reader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };
          # SponsorBlock
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };
          # Return Youtube Dislikes
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "force_installed";
          };
          # TWP - Translate Web Pages
          "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}"  = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/traduzir-paginas-web/latest.xpi";
            installation_mode = "force_installed";
          };
          # Vimium-ff
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
            installation_mode = "force_installed";
          };
          # Tridactyl
         # "tridactyl.vim@cmcaine.co.uk" = {
         #   install_url = "https://tridactyl.cmcaine.co.uk/betas/nonewtab/tridactyl_nonewtab_beta-1.24.5pre7325.xpi";
         #   installation_mode = "force_installed";
         # };
         #"ImABarbieGirlInABarbieWoooorldLifeInPlastic@IsFantastic" = {
         #   install_url = "file:///home/ivana/.swSRC/5d9b1b2586d94132a9b6-1.24.5pre7325.xpi";
         #   installation_mode = "force_installed";
         #};
        };
        Cookies = {
          Allow = [ 
            # Dev
            "https://github.com"
            
            # Cloud
            "https://robot.hetzner.com"
            "https://console.hetzner.com"

            # Forums
            "https://discourse.nixos.org"
            
            # Publishing
            "https://substack.com"
            
            # Google Ecosystem
            "https://youtube.com"
            "https://accounts.google.com"
            "https://mail.google.com"
            "https://maps.google.com"
            
            # Shopping
            "https://amazon.co.uk"
            "https://ebay.co.uk"
            
            # Email
            "https://app.fastmail.com"
            "https://www.fastmail.com"
           
            # Job Searching
            "https://rxresu.me"
            "https://www.linkedin.com"
            "https://www.indeed.co.uk"
            "https://www.reed.co.uk"
            "https://www.totaljobs.com"
            "https://www.cv-library.co.uk"
          ];
        };
      };
    };
  };  
}
