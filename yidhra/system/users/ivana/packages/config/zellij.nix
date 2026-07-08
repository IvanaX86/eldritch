{ config, pkgs, ... }:
{
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;

      attachExistingSession = true;
      exitShellOnExit = true;

      extraConfig = ''
        show_startup_tips false
        
        layout {
          pane size="90%"
          pane size="10%"
        }
        keybinds {
          normal {
            unbind "Ctrl g" "Ctrl p" "Ctrl h" "Ctrl s" "Ctrl o" "Alt n" "Alt f"

            bind   "Ctrl t" { SwitchToMode "locked"  ;                  }
            bind   "Ctrl y" { SwitchToMode "Pane"    ;                  }
            bind   "Ctrl u" { SwitchToMode "Tab"     ;                  }
            bind   "Ctrl i" { SwitchToMode "move"    ;                  }
            bind   "Ctrl b" { SwitchToMode "scroll"  ;                  }
            bind   "Ctrl n" { SwitchToMode "session" ;                  }
            bind   "Ctrl q" { Quit                   ;                  }
          }
          locked {
            unbind "Ctrl g"
            bind   "Ctrl t" { SwitchToMode "normal"  ;                  }
          }
          pane {
            // Setup
            unbind "n"
            unbind "Ctrl p"
            bind   "Ctrl y" { SwitchToMode "normal"  ;                  }
            
            // Pane Construction
            bind   "b"      { NewPane      "Left"    ; MovePane "Left"; }
            bind   "n"      { NewPane      "Down"    ;                  }
            bind   "m"      { NewPane      "Up"      ; MovePane "Up";   }
            bind   ","      { NewPane      "Right"   ;                  }

            // Pane Resizing | Increase
            bind   "y"     { Resize "Increase Left"  ;                  }
            bind   "u"     { Resize "Increase Down"  ;                  }
            bind   "i"     { Resize "Increase Up"    ;                  }
            bind   "o"     { Resize "Increase Right" ;                  }

            // Pane Resizing | Decrease
            bind   "Y"     { Resize "Decrease Left"  ;                  }
            bind   "U"     { Resize "Decrease Down"  ;                  }
            bind   "I"     { Resize "Decrease Up"    ;                  }
            bind   "O"     { Resize "Decrease Right" ;                  }
          }
          tab {
            unbind "Ctrl t"
            bind   "Ctrl u" { SwitchToMode "normal"  ;                  }
          }
          move {
            unbind "Ctrl h"
            bind   "Ctrl o" { SwitchToMode "normal"  ;                  }
          }
          scroll {
            unbind "Ctrl s"
            bind   "Ctrl b" { SwitchToMode "normal"  ;                  }
          }
          session {
            unbind "Ctrl o"
            bind   "Ctrl n" { SwitchToMode "normal"  ;                  }
          }
        }
      '';

      settings = {
        default_layout = "default_split"; 
      };
    };
  };
  xdg = {
    configFile = {
      "zellij/layouts/default_split.kdl".text = ''
        layout {
          pane size=1 borderless=true {
            plugin location="tab-bar"
          }

          pane size="90%"
          pane size="10%"

          pane size=1 borderless=true {
            plugin location="status-bar"
          }
        }
      '';
    };
  };
}
