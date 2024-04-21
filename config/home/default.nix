{ config, pkgs, ... }:

{
  imports = [
	./starship.nix
	./alacritty.nix
	./zsh.nix
	./home-packages.nix
        ./git.nix
        ./hyprland.nix
	./palette.nix
	./rofi.nix
	./swaylock.nix
	./swaync.nix
	./wlogout.nix
	./waybar.nix
  ];
}
