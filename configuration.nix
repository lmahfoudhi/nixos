

{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./config/system
    ];
  
  system.stateVersion = "23.11"; 

}
