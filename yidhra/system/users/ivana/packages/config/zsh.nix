{ config, lib, pkgs, ... }:
{ #TODO Setup Starship
  programs = {
    zsh = {
      enable = true;
      initContent = lib.mkMerge [
       (lib.mkOrder 500 ("
            PS1='%F{199}%n%f%F{163}@%f%F{196}%m%f %F{202}|%f %F{207}%B%~%b%f %F{201}❯%f '
	    bindkey -v
          "
	  + builtins.readFile ./zsh/nixos-rebuild-flake-completion.zsh
	))
      ];

      shellAliases = {
      	"cat" = "bat";
	"ls" = "lsd -v --group-directories-first --total-size";
        "lsa" = "lsd -va --group-directories-first --total-size";
	"lsaa" = "lsd -vail --group-directories-first --total-size ";
        "lsg" = "lsd -v --git --group-directories-first --total-size";
        "lsga" = "lsd -va --git --group-directories-first --total-size";
	"tree" = "lsd --tree --depth 5";
        "grep" = "grep --color=auto";
        "diff" = "diff --color=auto";
        "ip" = "ip -c=auto";
        "battery_level" = "echo $(cat /sys/class/power_supply/BAT0/capacity)%";
      };

      history = {
        append = true;
      	expireDuplicatesFirst = true;
	ignoreAllDups = true;
      };

      historySubstringSearch = {
        enable = true;
      };
      
      setOptions = [
        "NO_BEEP"
      ];

      syntaxHighlighting = {
        enable = true;
	highlighters = [
          "brackets"
	];
      };

      antidote = {
	enable = true;
	plugins = [
	  "jeffreytse/zsh-vi-mode"
	  "lincheney/fzf-tab-completion path:zsh/"
	];
      };
    };
  };
  home = {
    shell = {
      enableZshIntegration = true;
    };
  };
}
