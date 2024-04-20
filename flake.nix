{
description = "NixOS Flake";
inputs = {
   nixpkgs.url = "nixpkgs/nixos-unstable";
   home-manager = {
	url = "github:nix-community/home-manager";
  	inputs.nixpkgs.follows = "nixpkgs";
   };
   hyprland.url = "github:hyprwm/Hyprland";
   nix-colors.url = "github:misterio77/nix-colors";
};

outputs = { home-manager, nixpkgs, ... }@inputs:

{    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [ ./configuration.nix
                            home-manager.nixosModules.home-manager
                            {
                              home-manager.useGlobalPkgs = true;
                              home-manager.useUserPackages = true;
			      home-manager.extraSpecialArgs = { inherit inputs; };
                              home-manager.users.lain = import ./home.nix;
                            } 
                          ];

	};
    };
};
}
