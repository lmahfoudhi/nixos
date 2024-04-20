{ pkgs, config, ... }:

{
 environment.systemPackages = with pkgs; [
    vim
    awscli2
    python3
    go
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
