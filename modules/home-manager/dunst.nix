{pkgs, ...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 300;
        height = 200;
        origin = "top_right";
        offset = "10x50";
        scale = 0;
        notification_limit = 5;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 300;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 0;
        icon_corner_radius = 0;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 9;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#fff";
        gap_size = 0;
        separator_color = "frame";
        sort = "yes";
        font = "Jetbrains Mono 8";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        enable_recursive_icon_lookup = true;
        icon_theme = "Qogir";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        icon_path = "usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
        sticky_history = "yes";
        history_length = 20;
        dmenu = "/usr/bin/dmenu -p dunst:";
        browser = "/usr/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#00000080";
        foreground = "#ffffff";
        timeout = 10;
      };
      urgency_normal = {
        background = "#00000080";
        foreground = "#ffffff";
        timeout = 10;
      };
      urgency_critical = {
        background = "#96060680";
        foreground = "#ffffff";
        frame_color = "#ffffff";
        timeout = 0;
      };
    };
  };
}
