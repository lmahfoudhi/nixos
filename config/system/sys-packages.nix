{ pkgs, config, ... }:

{
 environment.systemPackages = with pkgs; [
    vim
    lshw
    ripgrep
    bat
    winetricks
    wineWowPackages.stable
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
