{ config, pkgs, ... }:

{

 programs.zsh.enable = true;

 users.users.lain = {
    isNormalUser = true;
    description = "lain";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
    shell = pkgs.zsh;
  };

}

