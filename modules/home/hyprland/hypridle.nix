{ pkgs, ... }:

let
  lock_cmd = pkgs.writeShellApplication {
    name = "lock_cmd";
    runtimeInputs = with pkgs; [ grim ];
    text = ''
     TMPBG=/tmp/bg.png
     grim $TMPBG
     pidof hyprlock || hyprlock
     rm $TMPBG
    '';
  };

  post_sleep = pkgs.writeShellApplication {
    name = "post_sleep";
    text = ''
     hyprctl dispatch dpms on
     rfkill unblock wlan
    '';
  };
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
          lock_cmd = "${lock_cmd}/bin/lock_cmd";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "${post_sleep}/bin/post_sleep";
          ignore_dbus_inhibit = false;
      };
      
      listener = [
        {
            timeout = 150;
            on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
            on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
            timeout = 300;
            on-timeout = "loginctl lock-session";
        }
        {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
        }
        {
            timeout = 1800;
            on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
