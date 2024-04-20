{ config, inputs, ... }:

{
  imports = [
          inputs.nix-colors.homeManagerModules.default
     ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-soft;

}
