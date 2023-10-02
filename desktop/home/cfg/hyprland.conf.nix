''
  $base           = 0xff191724
  $surface        = 0xff1f1d2e
  $overlay        = 0xff26233a
  $muted          = 0xff6e6a86
  $subtle         = 0xff908caa
  $text           = 0xffe0def4
  $love           = 0xffeb6f92
  $gold           = 0xfff6c177
  $rose           = 0xffebbcba
  $pine           = 0xff31748f
  $foam           = 0xff9ccfd8
  $iris           = 0xffc4a7e7
  $highlightLow   = 0xff21202e
  $highlightMed   = 0xff403d52
  $highlightHigh  = 0xff524f67

  monitor =     DP-1, 1920x1080@240, 0x0   , 1, bitdepth, 10
  monitor = HDMI-A-1, 1920x1080@60 , 1920x0, 1, bitdepth, 10

  workspace = 1, monitor:DP-1
  workspace = 2, monitor:DP-1
  workspace = 3, monitor:DP-1
  workspace = 4, monitor:DP-1
  workspace = 5, monitor:DP-1
  workspace = 6, monitor:DP-1
  workspace = 7, monitor:DP-1
  workspace = 8, monitor:HDMI-A-1
  workspace = 9, monitor:HDMI-A-1
  workspace = 10, monitor:HDMI-A-1

  env = EDITOR, nvim
  env = WLR_NO_HARDWARE_CURSORS, 1
  env = NIXOS_OZONE_WL, 1

  input {
      kb_layout = de
      follow_mouse = 1
      sensitivity = -0.25 # -1.0 - 1.0, 0 means no modification.
  }

  general {
      gaps_out = 16
      gaps_in = 8
      border_size = 2
      col.active_border = $rose $pine 45deg
      col.inactive_border = $muted
      layout = dwindle
  }

  decoration {
      rounding = 4
      drop_shadow = yes
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)
  }

  animations {
      enabled = false
  }

  bindr = SUPER, SUPER_L, exec, bemenu-run -l 7
  bind = SUPER, RETURN, exec, alacritty
  bind = SUPER, C, killactive,
  bind = SUPER SHIFT, C, exit,
  bind = SUPER, W, togglefloating,

  bind = SUPER, 1, workspace, 1
  bind = SUPER, 2, workspace, 2
  bind = SUPER, 3, workspace, 3
  bind = SUPER, 4, workspace, 4
  bind = SUPER, 5, workspace, 5
  bind = SUPER, 6, workspace, 6
  bind = SUPER, 7, workspace, 7
  bind = SUPER, 8, workspace, 8
  bind = SUPER, 9, workspace, 9
  bind = SUPER, 0, workspace, 10

  bind = SUPER SHIFT, 1, movetoworkspace, 1
  bind = SUPER SHIFT, 2, movetoworkspace, 2
  bind = SUPER SHIFT, 3, movetoworkspace, 3
  bind = SUPER SHIFT, 4, movetoworkspace, 4
  bind = SUPER SHIFT, 5, movetoworkspace, 5
  bind = SUPER SHIFT, 6, movetoworkspace, 6
  bind = SUPER SHIFT, 7, movetoworkspace, 7
  bind = SUPER SHIFT, 8, movetoworkspace, 8
  bind = SUPER SHIFT, 9, movetoworkspace, 9
  bind = SUPER SHIFT, 0, movetoworkspace, 10

  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow

  binde = , XF86AudioRaiseVolume, exec, vol inc
  binde = , XF86AudioLowerVolume, exec, vol dec
  bind = , KP_ADD, exec, vol mic
  bind = , KP_SUBSTRACT, pass, ^(com\.obsproject\.Studio)$

  bind = , PRINT, exec, grimblast --freeze copy area

  exec-once = hyprpaper
  exec-once = eww open-many bar mid
''
# exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

