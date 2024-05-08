
{ pkgs, config, lib, inputs, ... }:

let
  theme = config.colorScheme.palette;
in with lib; {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
#    plugins = [ inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars ];
    extraConfig = let
      modifier = "SUPER";
    in concatStrings [ ''
      monitor=,preferred,auto,1.2
      general {
        gaps_in = 6
        gaps_out = 8
        border_size = 2
        col.active_border = rgba(${theme.base0C}ff) rgba(${theme.base0D}ff) rgba(${theme.base0B}ff) rgba(${theme.base0E}ff) 45deg
        col.inactive_border = rgba(${theme.base00}cc) rgba(${theme.base01}cc) 45deg
        layout = dwindle
        resize_on_border = true
      }

      input {
        kb_layout = fr
        kb_variant = azerty
        kb_options = grp:alt_shift_toggle     
      }
      
      env = NIXOS_OZONE_WL, 1
      env = NIXPKGS_ALLOW_UNFREE, 1
      env = XDG_CURRENT_DESKTOP, Hyprland
      env = XDG_SESSION_TYPE, wayland
      env = XDG_SESSION_DESKTOP, Hyprland
      env = GDK_BACKEND, wayland
      env = CLUTTER_BACKEND, wayland
      env = SDL_VIDEODRIVER, "x11"
      env = QT_QPA_PLATFORM, wayland
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
      env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
      env = MOZ_ENABLE_WAYLAND, 1
      env = WLR_NO_HARDWARE_CURSORS,1
      env = LIBVA_DRIVER_NAME,nvidia
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
   
      misc {
        mouse_move_enables_dpms = true
        key_press_enables_dpms = false
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }
     animations {
        enabled = yes

        bezier = ease,0.4,0.02,0.21,1

        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
    }
        
      decoration {
        rounding = 10
        drop_shadow = false
        blur {
            enabled = true
            size = 5
            passes = 3
            new_optimizations = on
            ignore_opacity = on
        }
      }
      
      exec = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec = dbus-update-activation-environment --systemd --all
      exec-once = $POLKIT_BIN
      exec-once = swww-daemon && swww img ./files/wallpaper.png
      exec-once = waybar
      exec-once = swaync
      exec-once = nm-applet --indicator
      exec-once = swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'
      dwindle {
        pseudotile = true
        preserve_split = true
      }
      master {
        new_is_master = true
      }
      bind = ${modifier},Return,exec,alacritty
      bind = ${modifier}SHIFT,Return,exec,rofi-launcher
      bind = ${modifier}SHIFT,N,exec,swaync-client -rs
      bind = ${modifier},W,exec,firefox
      bind = ${modifier},D,exec,discord
      bind = ${modifier},T,exec,thunar
      bind = ${modifier},Q,killactive,
      bind = ${modifier}SHIFT,I,togglesplit,
      bind = ${modifier},F,fullscreen,
      bind = ${modifier}SHIFT,F,togglefloating,
      bind = ${modifier}SHIFT,C,exit,
      bind = ${modifier}SHIFT,left,movewindow,l
      bind = ${modifier}SHIFT,right,movewindow,r
      bind = ${modifier}SHIFT,up,movewindow,u
      bind = ${modifier}SHIFT,down,movewindow,d
      bind = ${modifier}SHIFT,h,movewindow,l
      bind = ${modifier}SHIFT,l,movewindow,r
      bind = ${modifier}SHIFT,k,movewindow,u
      bind = ${modifier}SHIFT,j,movewindow,d
      bind = ${modifier},left,movefocus,l
      bind = ${modifier},right,movefocus,r
      bind = ${modifier},up,movefocus,u
      bind = ${modifier},down,movefocus,d
      bind = ${modifier},h,movefocus,l
      bind = ${modifier},l,movefocus,r
      bind = ${modifier},k,movefocus,u
      bind = ${modifier},j,movefocus,d
      bind = ${modifier}, code:10, workspace, 1
      bind = ${modifier}, code:11, workspace, 2
      bind = ${modifier}, code:12, workspace, 3
      bind = ${modifier}, code:13, workspace, 4
      bind = ${modifier}, code:14, workspace, 5
      bind = ${modifier}, code:15, workspace, 6
      bind = ${modifier}, code:16, workspace, 7
      bind = ${modifier}, code:17, workspace, 8
      bind = ${modifier}, code:18, workspace, 9
      bind = ${modifier}, code:19, workspace, 10
      bind = ${modifier} SHIFT, code:10, movetoworkspace, 1
      bind = ${modifier} SHIFT, code:11, movetoworkspace, 2
      bind = ${modifier} SHIFT, code:12, movetoworkspace, 3
      bind = ${modifier} SHIFT, code:13, movetoworkspace, 4
      bind = ${modifier} SHIFT, code:14, movetoworkspace, 5
      bind = ${modifier} SHIFT, code:15, movetoworkspace, 6
      bind = ${modifier} SHIFT, code:16, movetoworkspace, 7
      bind = ${modifier} SHIFT, code:17, movetoworkspace, 8
      bind = ${modifier} SHIFT, code:18, movetoworkspace, 9 
      bind = ${modifier} SHIFT, code:19, movetoworkspace, 10
      bind = ${modifier}CONTROL,right,workspace,e+1
      bind = ${modifier}CONTROL,left,workspace,e-1
      bind = ${modifier},mouse_down,workspace, e+1
      bind = ${modifier},mouse_up,workspace, e-1
      bindm = ${modifier},mouse:272,movewindow
      bindm = ${modifier},mouse:273,resizewindow
      bind = ALT,Tab,cyclenext
      bind = ALT,Tab,bringactivetotop
      bind = ,XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bind = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioPause, exec, playerctl play-pause
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioPrev, exec, playerctl previous
      bind = ,XF86MonBrightnessDown,exec,brightnessctl set 5%-
      bind = ,XF86MonBrightnessUp,exec,brightnessctl set +5%
    '' ];
  };
}

