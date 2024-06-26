{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = [
        "wallpaper-fix"
        #"/etc/nixos/modules/home-manager/scripts/borders.sh"
        "swayidle -w timeout 600 'swaylock'"
        "waybar"
        "dunst"
        "nm-applet"
        "blueman-applet"
        "hyprctl setcursor Bibata-Modern-Classic 24"
        "systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service"
        "activate-linux --text-title 'Activate NixOS' --text-message 'Go to /etc/nixos to activate NixOS' --text-font 'Fira Code'"
        "mpv /etc/nixos/modules/home-manager/hyprland/startup.wav" # HARDCODED!
      ];

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgba(FFFFFFFF) rgba(FFFFFFFF) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 20;
        inactive_opacity = 0.95;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
        bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
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

      master = {
        new_is_master = true;
      };

      monitor = [
        "HDMI-1, 2560x1440@59.95, auto, 1"
        "eDP-1, 1920x1080@59.95, auto, 1"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      "$mod" = "SUPER";
      bind = [
        "$mod, W, exec, firefox"
        "$mod, T, exec, thunar"
        "$mod, Return, exec, kitty tmux"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, D, exec, rofi -show drun -config /etc/nixos/modules/home-manager/rofi/rofidmenu.rasi"
        "$mod, H, exec,  keybinds"
        "$mod ALT, V, exec, clipboard"
        "$mod SHIFT, Q, exec, wlogout"
        "$mod ALT, C, exec, color-picker"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, S, exec, screenshot"
        "$mod, F, fullscreen"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "CTRL, left, swapwindow, l"
        "CTRL, right, swapwindow, r"
        "CTRL, up, swapwindow, u"
        "CTRL, down, swapwindow, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -t 2000 \"Muted\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && notify-send -t 2000 \"Volume Raised\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify-send -t 2000 \"Volume Lowered\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- && notify-send -t 2000 \"Decreased brightness to\" \"$(brightnessctl get)\""
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% && notify-send -t 2000 \"Increased brightness to\" \"$(brightnessctl get)\""
      ];

      bindm = [
        "$mod, mouse:273, resizewindow"
        "$mod, mouse:272, movewindow"
      ];

      decoration = {};

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };

      windowrulev2 = [
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"
        "stayfocused,class:(Rofi)"
        "forceinput,class:(Rofi)"
      ];
    };
  };
}
