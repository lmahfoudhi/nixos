{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
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
