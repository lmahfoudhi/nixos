{ pkgs, config, ... }:

{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = pkgs.lib.importTOML ./files/starship.toml;
  };
}
