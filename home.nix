{ config, pkgs, inputs, ... }:

{
  imports = [
 	./config/home
     ];

  
   home.username = "lain";
   home.homeDirectory = "/home/lain";
    
   home.stateVersion = "23.11";

   programs.home-manager.enable = true;
}
