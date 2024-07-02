{ pkgs, config, ... }:

{
 environment.systemPackages = with pkgs; [
    vlc
    vscodium
    vim
    wireguard-tools
    jq
    openresolv
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
    p7zip
    transmission_4-qt
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
