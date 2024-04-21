{ pkgs, config, inputs, ... }:

{
    imports = [
	./hardware-configuration.nix
        ./boot.nix
        ./gpu.nix
        ./display-manager.nix
	./users.nix
	./services.nix
	./locals.nix
	./network.nix
	./nix-config.nix
	./fonts.nix
	./sys-packages.nix
	./polkit.nix
	./env.nix
	./kernel.nix
    ];
}
