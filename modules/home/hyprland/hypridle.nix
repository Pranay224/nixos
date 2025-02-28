let
  lock_cmd = builtins.toFile "lock_cmd.sh" "
    #!/usr/bin/env bash\n
    
    TMPBG=/tmp/bg.png\n
    grim $TMPBG\n
    pidof hyprlock || hyprlock\n
    rm $TMPBG\n
  ";
  post_sleep = builtins.toFile "post_sleep.sh" "
    hyprctl dispatch dpms on\n
    rfkill unblock wlan\n
  ";
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
          lock_cmd = "sh ${lock_cmd}";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "sh ${post_sleep}";
          ignore_dbus_inhibit = false;
      };
      
      listener = [
        {
            timeout = 150;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
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
