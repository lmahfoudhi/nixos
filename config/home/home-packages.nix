{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    gnome.gnome-tweaks
  ];
}
