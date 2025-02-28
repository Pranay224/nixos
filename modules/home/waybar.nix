{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 47;
        output = [ "eDP-1" ];

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "disk" "memory" "cpu" "network" "battery" ];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          tooltip = false;
          all-outputs = true;
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "default" = "";
          };
        };

        "clock" = {
          timezone = "Asia/Kolkata";
          format = "{:%I:%M %p  %A %b %d}";
          tooltip = false;
        };

        "pulseaudio" = {
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          tooltip = false;
        };

        disk = {
          format = " {percentage_used}%";
          tooltip = false;
        };

        memory = {
          format = " {percentage}%";
          tooltip = false;
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
        };

        network = {
          format-wifi = " {essid}";
          format-disconnected = "⚠ Disconnected";
          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{capacity}% {icon}";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          tooltip = false;
          on-click = "";
          format-icons = [ "" "" "" "" "" ];
        };
      };
    };
    style = /* css */ ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;


      * {
        border: none;
        font-family: 'FiraCode Nerd Font';
        font-size: 18px;
        min-height: 15px;
        margin-bottom: 1px;
      }

      window#waybar {
        background-color: transparent;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        border-radius: 25px;
        background-color: #282828;
        margin-top: 5px;
        margin-right: 15px;
        margin-left: 10px;
        padding-top: 2px;
        padding-left: 10px;
        padding-right: 10px;
        background-color: @mantle;
      }

      .modules-left {
        padding-top: 5px;
      }


      #workspaces button,
      #temperature,
      #pulseaudio,
      #clock,
      #backlight,
      #disk,
      #memory,
      #cpu,
      #network,
      #battery,
      #tray {
        padding-left: 10px;
        padding-right: 10px;
        color: @text;
      }
    '';
  };
}

