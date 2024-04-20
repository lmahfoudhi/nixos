{ pkgs, config, inputs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    layout = "fr";
    xkbVariant = "";
    libinput.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
    };
  };

  programs.dconf.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  environment.systemPackages =
   let
    tokyo-night = pkgs.libsForQt5.callPackage ../pkgs/sddm-tokyo-night.nix {};
   in [ 
    tokyo-night # Name: tokyo-night-sddm
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

}
