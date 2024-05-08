{ pkgs, config, ... }:

{
 environment.systemPackages = with pkgs; [
    vim
    awscli2
    calibre
    python3
    networkmanagerapplet
    polkit_gnome
    libvirt
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
