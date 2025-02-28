{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    
    settings = {
      "monitor" = ",1920x1080,auto,1";

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$menu" = "rofi -modi drun,run -show drun";

      # env = [
        # "XCURSOR_SIZE,24"
        # "QT_QPA_PLATFORMTHEME,qt5ct"
        # "WLR_NO_HARDWARE_CURSORS,1"
      # ];
  
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
  
        follow_mouse = 1;
  
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
  
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = [ 2 10 10 10 ];
        border_size = 2;
        "col.active_border" = "rgba(0081c2ee) rgba(a8b8ecee) 45deg";
        "col.inactive_border" = "rgba(202032aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };


      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = -1;
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "workspace 1 silent, class: (Alacritty)"
        "workspace 2 silent, class: (firefox)"
        "workspace 3 silent, class: (libreoffice-startcenter)"
        "workspace 3 silent, class: (libreoffice-writer)"
        "workspace 3 silent, class: (libreoffice-draw)"
        "opaque, class: (soffice)"
        "forcergbx, class: (soffice)"
        "opacity 1 override, class: (soffice)"
      ];

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mod, F, fullscreen"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%+ -l 1.5"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%- -l 1.5"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      exec-once = [
        "waybar"
        "rfkill unblock wlan"
        "hypridle"
        "sway-audio-idle-inhibit"
        "hyprctl setcursor catppuccin-mocha-dark-cursors 32"
      ];
    };
  };
}
