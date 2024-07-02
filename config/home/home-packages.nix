{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    discord
    telegram-desktop
    pavucontrol
    spotify
    rofi-wayland
    swww
    swaynotificationcenter
    swayidle
    swaylock
    mpv
    polkit
    waybar
    steam
    gnome.gnome-tweaks
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
  ];
}
