{ config, pkgs, ... }:

{

programs = {
      zsh = {
          enable = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
	  shellAliases = {
             c = "cd ~/.config/nixos";
	     r = "sudo nixos-rebuild switch";
	  };
	  initExtra = ''
		      eval "$(starship init zsh)"
	  '';
          oh-my-zsh = {
            enable = true;
            plugins = [
              "git"
              "history"
            ];
          };
      };
  };

}
