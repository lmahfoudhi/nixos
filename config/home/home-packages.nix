{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    spotify
    rofi-wayland
    swww
    swaynotificationcenter
    swayidle
    swaylock
    mpv
    polkit
    waybar
    gnome.gnome-tweaks
  ];
}
